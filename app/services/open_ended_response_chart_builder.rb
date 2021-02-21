class OpenEndedResponseChartBuilder
    def initialize(question:)
        @question = question
    end

    def pie_chart_data
        if !@question.nil?
            default_data = { "neutral" => 0, "mixed" => 0, "slightly_negative" => 0, "negative" => 0, "slightly_positive" => 0, "positive" => 0 }
            pie_chart_data = default_data.merge(OpenEndedResponse.where(question_id: @question.id).group(:sentiment).count)
            print "pie_chart_data"
            if pie_chart_data.values.any?(&:positive?)
                pie_chart_data
            end
        end
    end
end