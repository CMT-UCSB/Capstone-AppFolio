class SurveyUserController < ApplicationController
  def show
    @surveyUser = SurveyUser.find_by(survey_id: params[:id])

    # if @surveyUser.blank?
    #   head :not_found
    #   return
    # end
  end
end
