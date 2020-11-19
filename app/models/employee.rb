class Employee < ApplicationRecord
  belongs_to :manager
  has_many :surveys
end
