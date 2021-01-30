class OpenEndedResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    survey = Survey.find(params[:id])
    question = Question.find(params[:question_id])

    this_survey_response = OpenEndedResponse.find_by(question_id: question.id, employee_id: params[:employee_id])
    if this_survey_response == nil
        @isFilled = false
    else
        # check if if has been at least one week since a response has last been saved
        weeks = ((DateTime.now.utc - this_survey_response.created_at) / (60 * 60 * 24 * 7))
        this_survey_response.update(elapsed_weeks: weeks)
        if this_survey_response.elapsed_weeks > 0
          @isFilled = false
        else
          @isFilled = true
        end
    end

    sentiment = GoogleNlpSentiment.new(input_text: params[:survey][:response])
    Rails.logger.info("sentiment: #{sentiment.inspect}")

    if @isFilled == false
        OpenEndedResponse.create!(employee: employee, question: question, response: params[:survey][:response], elapsed_weeks: 0,
                                  score: sentiment.getScore, magnitude: sentiment.getMagnitude)
    else
        this_survey_response.update(response: params[:survey][:response], score: sentiment.getScore, magnitude: sentiment.getMagnitude)
    end
    redirect_back(fallback_location: root_path)
  end
end