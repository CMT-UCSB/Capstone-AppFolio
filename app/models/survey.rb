class Survey < ApplicationRecord
    flag :day_of_weeks, [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]
    enum isAnonymous: [:anonymous, :identifiable]

    belongs_to :manager
    has_many :employee_surveys
    has_many :employees, through: :employee_surveys
    has_many :questions
    accepts_nested_attributes_for :questions, allow_destroy: true

    # def questions_attributes=(questions_attributes)
    #   questions_attributes.each do |i, questions_attributes|
    #     self.questions.build(questions_attributes)
    #   end
    # end
end
