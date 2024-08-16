# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Seed file for populating employees


# Create Departments
User.create!(email: 'admin@example.com', password: 'password', role: :admin)

sales_department = Department.create!(name: 'Sales')
engineering_department = Department.create!(name: 'Engineering')

# Create Employees
Employee.create!(
  first_name: 'John',
  last_name: 'Doe',
  email: 'john.doe@example.com',
  designation: 'SDR',
  department: sales_department
)

Employee.create!(
  first_name: 'Andrew',
  last_name: 'Intern',
  email: 'andrew.intern@example.com',
  designation: 'Intern',
  department: engineering_department
)
