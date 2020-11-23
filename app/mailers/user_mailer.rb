class UserMailer < ApplicationMailer
    default :from => "synergipwdreset@gmail.com"

    def self.bulk_email(manager)
        @recipients = manager.employees
        @recipients.each do |recipient|
          survey_notify(recipient, manager).deliver
        end
    end
   
    def survey_notify(employee, manager)
        @employee = employee
        @manager = manager
        mail(:to => @employee.email, :subject => "New Survey to Complete")
    end
end
