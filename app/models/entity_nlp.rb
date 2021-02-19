class EntityNlp < ApplicationRecord
  belongs_to :manager
  belongs_to :survey
  belongs_to :open_ended_response
end