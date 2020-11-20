class Survey < ApplicationRecord
  belongs_to :manager
  has_many :employees, through: :EmployeeSurveys
  has_many :questions
end
