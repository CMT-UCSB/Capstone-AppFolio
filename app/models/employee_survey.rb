class EmployeeSurvey < ApplicationRecord
    belongs_to :employee
    belongs_to :survey
end
