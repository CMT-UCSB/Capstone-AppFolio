class SurveysController < ApplicationController
    def show
        @employee = Employee.find(params[:employeeid])
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
        @question = Question.find_by(survey_id: params[:id])
        @questionPrompt = @question.prompt

        if @question.question_type == "mood"
            this_survey_response = MoodResponse.find_by(question_id: @question.id, employee_id: params[:employeeid])
            @response_url = surveys_mood_responses_path
        elsif @question.question_type == "open_ended"
            this_survey_response = OpenEndedResponse.find_by(question_id: @question.id, employee_id: params[:employeeid])
            @response_url = surveys_open_ended_responses_path
        end

        if this_survey_response == nil
            @isFilled = false
        else
            @isFilled = true
        end
        
    end

    # GET method to get all surveys from database
    def index
        @survey = Survey.new
        @survey.questions.build
        @surveys = Survey.where(manager_id: current_manager.id)
        gon.Survey = Survey.all
        gon.Employee = Employee.all
        gon.questions = Question.all
        gon.MoodResponse = MoodResponse.all
        gon.OpenEndedResponse = OpenEndedResponse.all
    end

    # GET method for the new survey
    def new
        @survey = Survey.new
        @survey.questions.build
    end

    # POST method for processing form data
    def create
        @survey = Survey.new(survey_params)
        @survey.manager_id = current_manager.id

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

    # GET method for editing a survey based on id
    def edit
    end

    # PUT method for updating in database a survey based on id
    def update
        respond_to do |format|
            if @survey.update_attributes(survey_params)
                format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
                format.json { render :show, status: :ok, location: @survey }
            else   
                format.html { render :edit }
                format.json { render json: @survey.errors, status: :unprocessable_entity }
            end
        end
    end

    # DELETE method for deleting a survey from database based on id
    def destroy
        @survey.destroy
        respond_to do |format|
            format.html { redirect_to survey_url, notice: 'Survey was successfully destroyed.' }
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
      params.require(:survey).permit(:name, :interval, :day_of_week, :time_of_day, :isAnonymous, questions_attributes: [:prompt, :question_type])
    end
end
