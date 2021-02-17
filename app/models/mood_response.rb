class MoodResponse < ApplicationRecord
    enum response: [:terrible, :bad, :okay, :good, :amazing]
    
    belongs_to :manager
    belongs_to :question
    belongs_to :employee
end