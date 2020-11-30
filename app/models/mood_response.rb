class MoodResponse < ApplicationRecord
    belongs_to :question
    belongs_to :employee
end