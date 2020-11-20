class Employee < ApplicationRecord
  belongs_to :manager
  has_many :surveys, through: :EmployeeSurveys
  has_many :open_ended_responses
  has_many :mood_responses
end
