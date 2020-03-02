require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'
require_relative './exercise8'

class ApparrelValidator < ActiveModel::Validator
  def validate(record)
    unless record.mens_apparel || record.womens_apparel
      record.errors[:mens_apparel] << "Need one apparel type"
    end
  end
end

class Store < ActiveRecord::Base
  validates :name, length: {minimum: 3}
  validates :annual_revenue, numericality: {
    greater_than: -1,
    only_integer: true
  }
  validates_with ApparrelValidator

  before_destroy :check_employees
  
  private

    def check_employees
      if Employee.find_by(store_id: self.id)
        false
      end
    end

end


@store1 = Store.find(1)
if @store1.destroy
  puts "Store destroyed! It has #{@store1.employees.size} =/"
else
  puts "Could not destroy store :)"
end

# Make sure empty stores can be destroyed
@empty_store = Store.create!(name: 'Test Empty Store', annual_revenue: 0, mens_apparel: true)
if @empty_store.destroy
  puts "Empty Store destroyed! This is good"
else
  puts "Whoa! Empty store should be destroyable... Not cool!"
end