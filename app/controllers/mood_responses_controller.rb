class MoodResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employee_id])
    survey = Survey.find(params[:id])
    question = Question.find(params[:question_id])

    this_survey_response = MoodResponse.where(question_id: question.id, employee_id: params[:employee_id])
    if this_survey_response == nil
      @isFilled = false
    else
      @isFilled = true
    end

    if @isFilled == false
      if params[:commit] == '😃'
        MoodResponse.create!(employee: employee, question: question, response: 4, elapsed: 0)
      elsif params[:commit] == '🙂'
        MoodResponse.create!(employee: employee, question: question, response: 3, elapsed: 0)
      elsif params[:commit] == '😐'
        MoodResponse.create!(employee: employee, question: question, response: 2, elapsed: 0)
      elsif params[:commit] == '😟'
        MoodResponse.create!(employee: employee, question: question, response: 1, elapsed: 0)
      elsif params[:commit] == '😭'
        MoodResponse.create!(employee: employee, question: question, response: 0, elapsed: 0)
      end
    else
      if params[:commit] == '😃'
        this_survey_response.update(response: 4)
      elsif params[:commit] == '🙂'
        this_survey_response.update(response: 3)
      elsif params[:commit] == '😐'
        this_survey_response.update(response: 2)
      elsif params[:commit] == '😟'
        this_survey_response.update(response: 1)
      elsif params[:commit] == '😭'
        this_survey_response.update(response: 0)
      end
    end

    redirect_back(fallback_location: root_path)
  end
end
