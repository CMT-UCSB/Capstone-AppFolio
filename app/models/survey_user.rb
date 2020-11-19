class SurveyUser < ApplicationRecord

  after_initialize :generate_survey_id, if: :new_record?
  private
  def generate_survey_id
    self.survey_id = SecureRandom.uuid
  end

  has_many :questions
  has_many :moods

end