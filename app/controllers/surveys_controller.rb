class SurveysController < ApplicationController
    def show
        @survey = Survey.find_by(id: params[:id])
        if ENV['RAILS_ENV'] == 'development'
            @url = "localhost:3000"
        else
            @url = "synergi.herokuapp.com"
        end
    
        # if @survey.blank?
        #   head :not_found
        #   return
        # end
    end

    # GET method to get all surveys from database
    def index
        @surveys = Survey.where(manager_id: current_manager.id)
    end

    # GET method for the new survey
    def new
        @survey = Survey.new
    end

    # POST method for processing form data
    def create
        @survey = Survey.new(survey_params)
        @survey.manager_id = current_manager.id

        respond_to do |format|
            if @survey.save   
                format.html { redirect_to '/account', notice: 'Survey was successfully created.' }
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
      params.require(:survey).permit(:interval, :day_of_week, :time_of_day, :isAnonymous)
    end
end
