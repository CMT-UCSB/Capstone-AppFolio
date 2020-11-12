class SurveyUser < ApplicationRecord
  
  def initialize
    super
    self.survey_id = SecureRandom.uuid
  end

end
