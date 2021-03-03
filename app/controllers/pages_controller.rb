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
    @selected_survey_id = get_survey_id
    @selected_elapsed = get_wordcloud_elapsed
  end

  def test
  end

  def get_wordcloud_surveys
    @picked_survey_id = 0
    if params[:wordcloud_survey_id].present?
      @picked_survey_id = params[:wordcloud_survey_id]
      # Rails.logger.info("\n\n ---\selected survey id: #{@selected_survey_id}\n\n")
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
        @picked_survey_id = @temp_survey[0].id
        # Rails.logger.info("\n\n ---\nfirst survey id: #{first_survey_id}\n\n")
        # Rails.logger.info("\n\n ---\selected survey id: #{@selected_survey_id}\n\n")
        return @open_survey
      else
        # Rails.logger.info("\n\n ---\selected survey id: #{@selected_survey_id}\n\n")
        return []
      end
    end
  end

  def get_survey_id
    # if @picked_survey_id.present?
    #   return @picked_survey_id
    # elsif @first_survey_id.present?
    #   return 
    # else
    #   return 0
    # end
    @picked_survey_id
  end

  def get_wordcloud_elapsed
    if params[:elapsed].present?
      params[:elapsed]
    else
      return 0
    end
  end
  
end
