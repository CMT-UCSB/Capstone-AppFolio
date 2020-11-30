class PagesController < ApplicationController
    before_action :authenticate_manager!, :only => [:account]
    skip_before_action :verify_authenticity_token
    def home
    end

    def send_emails
        @survey = Survey.find_by(id: params[:id])
        UserMailer.bulk_email(current_manager, @survey)
    end

    def account
        @survey = Survey.new
        @survey.questions.build
        @surveys = Survey.where(manager_id: current_manager.id)
    end

end