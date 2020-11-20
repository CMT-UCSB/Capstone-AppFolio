class EmployeeSurvey < ApplicationRecord
    has_many :employees
    has_many :surveys
end
