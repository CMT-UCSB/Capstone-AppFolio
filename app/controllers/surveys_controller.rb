class SurveysController < ApplicationController
  before_action :authenticate_manager!
  before_action :set_survey, only: [:show, :edit, :update, :destroy]

  # GET /surveys
  # GET /surveys.json
  def index
    @survey = Survey.new
    @survey.questions.build
    @surveys = Survey.where(manager: current_manager)
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
    # @employee = Employee.find(params[:employee_id])
    @survey = Survey.find(params[:id])
    if ENV['RAILS_ENV'] == 'development'
        @url = "localhost:3000"
    else
        @url = "synergi.herokuapp.com"
    end

    # if @survey.blank?
    #   head :not_found
    #   return
    # end
    if @survey.isAnonymous == "anonymous"
        @isAnon = true
    else
        @isAnon = false
    end
    @questions = Question.where(survey_id: params[:id])

    @response_paths = []
    @this_survey_responses = []
    @questions.each do |q|
        if q.question_type == "mood"
            @this_survey_responses.push(MoodResponse.find_by(question_id: q.id, employee_id: params[:employee_id]))
            @response_paths.push(surveys_mood_responses_path(id: @survey.id, question_id: q.id, employee_id: params[:employee_id]))
        elsif q.question_type == "open_ended"
            @this_survey_responses.push(OpenEndedResponse.find_by(question_id: q.id, employee_id: params[:employee_id]))
            @response_paths.push(surveys_open_ended_responses_path(id: @survey.id, question_id: q.id, employee_id: params[:employee_id]))
        end
    end
    if @this_survey_responses.all?
        @isFilled = true
    else
        @isFilled = false
    end
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    @survey.questions.build
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
        format.html { redirect_to '/surveys_tab', notice: 'Survey was successfully created.' }
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
        format.html { redirect_to '/surveys_tab', notice: 'Survey was successfully updated.' }
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
    @survey.destroy
    respond_to do |format|
      format.html { redirect_to '/surveys_tab', notice: 'Survey was successfully destroyed.' }
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
      params.require(:survey).permit(:name, :interval, :day_of_week, :time_of_day, :isAnonymous, questions_attributes: [:id, :prompt, :question_type, :_destroy])
    end
end
