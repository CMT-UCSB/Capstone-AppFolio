class Survey < ApplicationRecord
  belongs_to :manager
  has_many :employee_surveys
  has_many :employees, through: :employee_surveys
  has_many :questions

  def questions_attributes=(questions_attributes)
    questions_attributes.each do |i, questions_attributes|
      self.questions.build(questions_attributes)
    end
  end
end
