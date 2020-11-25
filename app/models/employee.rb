class Employee < ApplicationRecord
  belongs_to :manager
  has_many :employee_surveys
  has_many :surveys, through: :employee_surveys
  has_many :open_ended_responses
  has_many :mood_responses
end
