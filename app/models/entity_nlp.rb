class EntityNlp < ApplicationRecord
  belongs_to :surveys
  belongs_to :open_ended_response
end