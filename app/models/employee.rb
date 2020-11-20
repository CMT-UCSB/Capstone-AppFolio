class Employee < ApplicationRecord
  belongs_to :manager
  has_many :surveys, through: :EmployeeSurveys
end
