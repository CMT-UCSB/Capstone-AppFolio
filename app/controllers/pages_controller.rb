class PagesController < ApplicationController
    before_action :authenticate_manager!, :only => [:account]
    skip_before_action :verify_authenticity_token
    def home
    end

    def send_emails
        UserMailer.bulk_email(current_manager)
    end
end