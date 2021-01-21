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
        @questions = Question.where(survey_id: params[:id])

        @response_paths = []
        @this_survey_responses = []
        @questions.each do |q|
            if q.question_type == "mood"
                @this_survey_responses.push(MoodResponse.find_by(question_id: q.id, employee_id: params[:employeeid]))
                @response_paths.push(surveys_mood_responses_path(questionid: q.id))
            elsif q.question_type == "open_ended"
                @this_survey_responses.push(OpenEndedResponse.find_by(question_id: q.id, employee_id: params[:employeeid]))
                @response_paths.push(surveys_open_ended_responses_path(questionid: q.id))
            end
        end
        if @this_survey_responses.all?
            @isFilled = true
        else
            @isFilled = false
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
        params.require(:survey).permit(:name, :interval, :day_of_week, :time_of_day, :isAnonymous, questions_attributes: [:id, :prompt, :question_type, :_destroy])
    end
end
