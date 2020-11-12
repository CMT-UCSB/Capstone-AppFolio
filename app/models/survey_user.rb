class SurveyUser < ApplicationRecord

  # def initialize
  #   super
  #   self.survey_id = SecureRandom.uuid
  # end

  after_initialize :generate_survey_id
  private
  def generate_survey_id
    self.survey_id = SecureRandom.uuid
  end

end
