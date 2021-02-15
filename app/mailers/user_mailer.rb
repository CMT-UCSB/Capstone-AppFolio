require 'net/http'

class UserMailer < ApplicationMailer
  default :from => 'synergipwdreset@gmail.com'

  def self.bulk_email(manager, survey)
    @recipients = manager.employees
    @recipients.each do |recipient|
      survey_notify(recipient, manager, survey).deliver
    end

    questions = Question.where(survey_id: survey.id)

    questions.each do |q|
      if q.question_type == 'open_ended'
        response = OpenEndedResponse.find_by(question_id: q.id)
      else
        response = MoodResponse.find_by(question_id: q.id)
      end
      if response != nil
        response.update(elapsed: response.elapsed + 1)
      end
    end
  end

  def survey_notify(employee, manager, survey)
    @employee = employee
    @manager = manager
    @survey = survey
    if ENV['RAILS_ENV'] == 'development'
      @url = 'localhost:3000'
    else
      @url = 'synergi.herokuapp.com'
    end
    slack_id = @employee.slack_id
    slack_url = URI.parse('https://slack.com/api/chat.postMessage')
    req = Net::HTTP::Post.new(slack_url.to_s)
    req['Authorization'] = ENV['SLACK_AUTH']
    req['Content-Type'] = 'application/json'
    req.set_form_data('channel' => slack_id, 'text' => 'Hey there ' + @employee.first_name + '! You have a new survey from ' + @manager.email + ' to complete! Link: http://' + @url + '/employees/' + @employee.id + '/surveys/' + @survey.id, 'pretty' => 1)
    http = Net::HTTP.new(slack_url.host, slack_url.port)
    http.use_ssl = true
    res = http.start { |http|
      http.request(req)
    }
    puts res.body
    mail(:to => @employee.email, :subject => 'New Survey to Complete')
  end
end
