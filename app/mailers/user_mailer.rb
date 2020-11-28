class UserMailer < ApplicationMailer
    default :from => "synergipwdreset@gmail.com"

    def self.bulk_email(manager, survey)
        @recipients = manager.employees
        @recipients.each do |recipient|
          survey_notify(recipient, manager, survey).deliver
        end
    end
   
    def survey_notify(employee, manager, survey)
        @employee = employee
        @manager = manager
        @survey = survey
        if ENV['RAILS_ENV'] == 'development'
            @url = "localhost:3000"
        else
            @url = "synergi.herokuapp.com"
        end
        mail(:to => @employee.email, :subject => "New Survey to Complete")
    end
end
