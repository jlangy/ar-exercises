require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'

puts "Exercise 6"
puts "----------"

# Your code goes here ...
Store.has_many :employees
Employee.belongs_to :store

@store3 = Store.find_by(id: '4')

@store1.employees.create(first_name: "Khurram", last_name: "Virani", hourly_rate: 60)
@store2.employees.create(first_name: "Cher", last_name: "", hourly_rate: 1000)
@store3.employees.create(first_name: "Joe", last_name: "Schmo", hourly_rate: 1)