class MoodResponse < ApplicationRecord
    enum response: [:bad, :okay, :good]
    
    belongs_to :question
    belongs_to :employee
end