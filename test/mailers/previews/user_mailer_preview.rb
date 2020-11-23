# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
    def survey_notify_preview
        # testUser = {:name => "John Doe", :email => "testemail@gmail.com"}
        UserMailer.survey_notify(employee.first)
    end
end
