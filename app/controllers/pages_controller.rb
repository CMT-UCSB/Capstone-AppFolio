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
  end

  def test
  end
end
