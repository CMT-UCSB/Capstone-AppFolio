class Question < ApplicationRecord
  belongs_to :survey
  has_one :open_ended_response
  has_one :mood_response
end