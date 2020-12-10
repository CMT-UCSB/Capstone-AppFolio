class MoodResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employeeid])
    survey = Survey.find(params[:id])
    question = survey.questions.first

    this_survey_response = MoodResponse.find_by(question_id: question.id, employee_id: params[:employeeid])
    if this_survey_response == nil
        @isFilled = false
    else
        @isFilled = true
    end

    if @isFilled == false
      if params[:commit] == "😃"
        MoodResponse.create!(employee: employee, question: question, response: 2)
      elsif params[:commit] == "😐"
        MoodResponse.create!(employee: employee, question: question, response: 1)
      elsif params[:commit] == "😟"
        MoodResponse.create!(employee: employee, question: question, response: 0)
      end
    else
      if params[:commit] == "😃"
        this_survey_response.update(response: 2)
      elsif params[:commit] == "😐"
        this_survey_response.update(response: 1)
      elsif params[:commit] == "😟"
        this_survey_response.update(response: 0)
      end
    end
    redirect_to surveys_success_path
  end
end