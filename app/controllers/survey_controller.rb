class SurveyController < ApplicationController
    def show
        @employeeid = EmployeeSurvey.find_by(employee_id: params[:employeeid])
        @survey = Survey.find_by(id: params[:surveyid])
    
        # if @survey.blank?
        #   head :not_found
        #   return
        # end
    end
end
