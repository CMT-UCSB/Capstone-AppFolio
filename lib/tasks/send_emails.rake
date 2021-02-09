include Rails.application.routes.url_helpers

task :send_emails  => [ :environment ] do
  puts 'Current Hour: ' +  Time.now.strftime("%H")
  puts 'These are survey times'
  Survey.all.each do |s|
    puts s.name + ': ' + s.time_of_day.strftime("%H")
    if (Time.now.strftime("%H") == s.time_of_day.strftime("%H")) && 
      (Time.now.strftime("%A") == s.day_of_weeks.capitalize) then
        puts 'Sending emails for survey: ' + s.name
        PagesController.send_emails_task(s)
    end
  end
end