class Survey < ApplicationRecord
  belongs_to :manager
  has_many :employee_surveys
  has_many :employees, through: :employee_surveys
  has_many :questions
end
