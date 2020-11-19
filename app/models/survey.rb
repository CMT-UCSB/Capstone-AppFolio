class Survey < ApplicationRecord
  belongs_to :user

  after_initialize :generate_survey_id, if: :new_record?
  private
  def generate_survey_id
    self.survey_id = SecureRandom.uuid
  end
end
