require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

puts "Exercise 7"
puts "----------"

# Your code goes here ...
Employee.validates :first_name, presence: true
Employee.validates :last_name, presence: true
Employee.validates :store_id, presence: true
Employee.validates :hourly_rate, presence: true, numericality: {
  only_integer: true,
  greater_than: 39,
  less_than: 201
}

Store.validates :name, length: {minimum: 3}
Store.validates :annual_revenue, numericality: {
  greater_than: -1,
  only_integer: true
}

class ApparrelValidator < ActiveModel::Validator
  def validate(record)
    unless record.mens_apparel || record.womens_apparel
      record.errors[:mens_apparel] << "Need one apparel type"
    end
  end
end

Store.validates_with ApparrelValidator

puts "Gimme a store"
# store_name = gets.chomp

# puts store_name

# new_store = Store.create(name: store_name)

# new_store.errors.messages.each do |k, v|
#   puts "#{k} had error #{v}"
# end