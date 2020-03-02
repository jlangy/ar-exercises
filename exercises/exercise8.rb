require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'
require_relative './exercise_7'


class Employee < ActiveRecord::Base
  Employee.belongs_to :store

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :store_id, presence: true
  validates :hourly_rate, presence: true, numericality: {
    only_integer: true,
    greater_than: 39,
    less_than: 201
  }

  before_save :set_password

  private

    def set_password
      #for after_create, need to find employess and update password
      # this = Employee.find_by(first_name: self.first_name, last_name: self.last_name)
      self.password = (0...8).map { (65 + rand(26)).chr }.join
    end
end

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)

@store1.employees.each do |a|
  puts a.password
end
