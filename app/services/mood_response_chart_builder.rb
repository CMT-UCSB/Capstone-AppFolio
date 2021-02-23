class MoodResponseChartBuilder
    def initialize(question:)
        @question = question
    end

    def pie_chart_data
        if !@question.nil?
            default_data = { "terrible" => 0, "bad" => 0, "okay" => 0, "good" => 0, "amazing" => 0 }
            pie_chart_data = default_data.merge(MoodResponse.where(question_id: @question.id).group(:response).count)
            print "pie_chart_data"
            if pie_chart_data.values.any?(&:positive?)
                pie_chart_data
            end
        end
    end
end