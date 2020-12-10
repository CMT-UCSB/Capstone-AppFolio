class MoodResponsesController < ApplicationController
  def create
    employee = Employee.find(params[:employeeid])
    survey = Survey.find(params[:id])
    question = survey.questions.first

    this_survey_response = MoodResponse.find_by(question_id: question.id, employee_id: params[:employeeid])
    if this_survey_response == nil
        @isFilled = false
    else
        # check if if has been at least one week since a response has last been saved
        weeks = ((DateTime.now.utc - this_survey_response.created_at) / (60 * 60 * 24 * 7))
        this_survey_response.update(elapsed_time: weeks)
        if this_survey_response.elapsed_time > 0
          @isFilled = false
        else
          @isFilled = true
        end
    end

    if @isFilled == false
      if params[:commit] == "😃"
        MoodResponse.create!(employee: employee, question: question, response: 2, elapsed_time = 0)
      elsif params[:commit] == "😐"
        MoodResponse.create!(employee: employee, question: question, response: 1, elapsed_time = 0)
      elsif params[:commit] == "😟"
        MoodResponse.create!(employee: employee, question: question, response: 0, elapsed_time = 0)
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