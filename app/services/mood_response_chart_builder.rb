class MoodResponseChartBuilder
    def initialize(mood_survey:)
        @mood_survey = mood_survey
    end

    def pie_chart_data
        default_data = { "okay" => 0, "bad" => 0, "good" => 0 }
        pie_chart_data = default_data.merge(MoodResponse.where(id: @mood_survey.questions.map(&:id)).group(:response).count)
        if pie_chart_data.values.any?(&:positive?)
            pie_chart_data
        end
    end
end