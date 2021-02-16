class SurveyResponsesController < ApplicationController
  # GET /surveys/1/
  def show
    # @employee = Employee.find(params[:employee_id])
    @survey = Survey.find(params[:id])
    if ENV['RAILS_ENV'] == 'development'
      @url = 'localhost:3000'
    else
      @url = 'synergi.herokuapp.com'
    end

    # if @survey.blank?
    #   head :not_found
    #   return
    # end
    if @survey.isAnonymous == 'anonymous'
      @isAnon = true
    else
      @isAnon = false
    end
    @questions = Question.where(survey_id: params[:id])

    @response_paths = []
    @this_survey_responses = []
    @questions.each do |q|
      if q.question_type == 'mood'
        @this_survey_responses.push(MoodResponse.find_by(question_id: q.id, employee_id: params[:employee_id], elapsed: 0))
        @response_paths.push(surveys_mood_responses_path(id: @survey.id, question_id: q.id, employee_id: params[:employee_id]))
      elsif q.question_type == 'open_ended'
        @this_survey_responses.push(OpenEndedResponse.find_by(question_id: q.id, employee_id: params[:employee_id], elapsed: 0))
        @response_paths.push(surveys_open_ended_responses_path(id: @survey.id, question_id: q.id, employee_id: params[:employee_id]))
      end
    end
    if @this_survey_responses.all?
      @isFilled = true
    else
      @isFilled = false
    end
  end
end
