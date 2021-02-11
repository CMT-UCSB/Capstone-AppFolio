class SurveysController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @survey = Survey.new
    @survey.questions.build
    @surveys = Survey.where(manager: current_manager)
    gon.Survey = Survey.all
    gon.Employee = Employee.all
    gon.questions = Question.all
    gon.MoodResponse = MoodResponse.all
    gon.OpenEndedResponse = OpenEndedResponse.all
  end

  def survey_result
    #@open_response = OpenEndedResponse.where()
    
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.questions.build

    gon.Survey = Survey.all
    gon.questions = Question.all
    gon.current_manager = current_manager
  end

  # GET /surveys/1/edit
  def edit
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)
    @survey.manager = current_manager

    respond_to do |format|
      if @survey.save
        format.html { redirect_to '/surveys', notice: 'Survey was successfully created.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to '/surveys', notice: 'Survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    @survey.questions.each do |q|
      q.destroy
    end
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to '/surveys', notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_params
      params.require(:survey).permit(:name, :interval, :time_of_day, :isAnonymous, questions_attributes: [:id, :prompt, :question_type, :_destroy], day_of_weeks: [])
    end
end
