class UserMailer < ApplicationMailer
    default :from => "synergipwdreset@gmail.com"

    def survey_notify(user)
        @user = user
        mail(:to => @user.email, :subject => "New Survey to Complete")
    end
end
