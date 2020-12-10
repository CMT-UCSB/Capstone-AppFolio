class MoodResponseChartBuilder
    def initialize(mood_survey:)
        @mood_survey = mood_survey
    end

    def pie_chart_data
        default_data = { "okay" => 0, "bad" => 0, "good" => 0 }
        pie_chart_data = default_data.merge(MoodResponse.where(question_id: @mood_survey.questions.map(&:id)).group(:response).count)
        print "pie_chart_data"
        if pie_chart_data.values.any?(&:positive?)
            pie_chart_data
        end
    end
end