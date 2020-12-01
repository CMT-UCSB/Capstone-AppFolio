class OpenEndedResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employeeid])
    survey = Survey.find(params[:id])
    question = survey.questions.first

    this_survey_response = OpenEndedResponse.find_by(question_id: question.id, employee_id: params[:employeeid])
    if this_survey_response == nil
        @isFilled = false
    else
        @isFilled = true
    end

    if @isFilled == false
      OpenEndedResponse.create!(employee: employee, question: question, response: params[:survey][:response])
    else
      this_survey_response.update(response: params[:survey][:response])
    end
    redirect_to surveys_success_path
  end
end