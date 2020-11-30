class MoodResponseController < ApplicationController
  def create
    @moodResponse = MoodResponse.new(moodResponse_params)
    @moodResponse.employee_id = @employee
    @moodResponse.question_id = @question

    respond_to do |format|
      if params[:commit] == "😃"   
        format.json { render :show, status: :created, location: @moodResponse }
      elsif params[:commit] == "😐"
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      elsif params[:commit] == "😟"
        format.json { render :show, status: :created, location: @moodResponse }
      end
    end
  end

  def moodResponse_params
    params.require(:moodResponse).permit(:response)
  end

end