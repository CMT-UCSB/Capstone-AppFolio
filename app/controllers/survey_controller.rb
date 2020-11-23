class SurveyController < ApplicationController
    def show
        @survey = Survey.find_by(id: params[:id])
    
        # if @survey.blank?
        #   head :not_found
        #   return
        # end
    end
end
