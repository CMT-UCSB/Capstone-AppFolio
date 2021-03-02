class PagesController < ApplicationController
  before_action :authenticate_manager!, :only => [:account]
  skip_before_action :verify_authenticity_token

  def home
  end

  def send_emails
    @survey = Survey.find_by(id: params[:id])
    UserMailer.bulk_email(current_manager, @survey, false)
  end

  def self.send_emails_task(survey)
    UserMailer.bulk_email(survey.manager, survey, true)
  end

  def account
    gon.questions = Question.all
    gon.MoodResponse = MoodResponse.all
    gon.Manager = current_manager
    gon.Surveys = Survey.all
    @surveys = Survey.where(manager_id: current_manager.id)
    @wordcloud_surveys = get_wordcloud_surveys
  end

  def test
  end

  def get_wordcloud_surveys
    if params[:wordcloud_survey_id].present?
      @surveys.where(id: params[:wordcloud_survey_id])
    else
      @open_survey = []
      @temp_survey = []
      e = @surveys.sort_by(&:updated_at).reverse
      e.each do |survey|
        if Question.find_by(survey_id: survey.id).question_type == "open_ended"
          @temp_survey << survey
        end
      end
      if @temp_survey[0].present?
        @open_survey << @temp_survey[0]
        # Rails.logger.info("\n\n ---\n most recent surveys[0]: #{@open_survey}\n\n")
        return @open_survey
      else
        return []
      end
    end
  end

  
end
