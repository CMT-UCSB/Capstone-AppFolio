class OpenEndedResponse < ApplicationRecord
    belongs_to :manager
    belongs_to :question
    belongs_to :employee
    enum status: { neutral: "neutral", mixed: "mixed", slightly_negative: "slightly_negative", negative: "negative", slightly_positive: "slightly_positive", positive: "positive" }
    
end