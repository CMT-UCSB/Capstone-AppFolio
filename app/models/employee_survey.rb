class EmployeeSurvey < ApplicationRecord
    belongs_to :employees
    belongs_to :surveys
end
