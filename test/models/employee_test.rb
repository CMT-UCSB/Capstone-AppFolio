require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
  setup do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    sign_in @manager
  end
  
  test "is not valid when empty" do
    employee = Employee.new()
    assert_not employee.save
  end

  test "valid when data is passed" do
    employee = Employee.new(first_name: 'John', last_name: 'Doe', email: 'test2@gmail.com', manager: @manager)
    assert employee.save
  end
end
