class Question < ApplicationRecord
  enum question_type: [:mood, :open_ended]

  belongs_to :survey
  has_one :open_ended_response
  has_one :mood_response
end