class Note < ApplicationRecord
  belongs_to :manager
  default_scope -> { order(created_at: :desc) }
end
