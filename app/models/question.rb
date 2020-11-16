class Question < ApplicationRecord
  belongs_to :survey_user
  default_scope -> { order(created_at: :desc) }
end  