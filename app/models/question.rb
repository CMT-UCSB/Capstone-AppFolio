class Question < ApplicationRecord
  enum question_type: [:mood, :open_ended]

  belongs_to :survey
  has_many :open_ended_response
  has_many :mood_response
end