class Survey < ApplicationRecord
  belongs_to :manager
  has_many :employees, through: :EmployeeSurveys
end
