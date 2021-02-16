include Rails.application.routes.url_helpers

task :send_emails => [:environment] do
  puts 'Current Hour: ' + Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%H')
  puts 'These are survey times'
  Survey.all.each do |s|
    puts s.day_of_weeks
    puts s.name + ': ' + s.time_of_day.strftime('%H')
    if (Time.now.in_time_zone('Pacific Time (US & Canada)').strftime('%H') == s.time_of_day.strftime('%H')) &&
       (s.day_of_weeks.include? Time.now.strftime('%A').downcase.to_sym)
      puts 'Sending emails for survey: ' + s.name
      PagesController.send_emails_task(s)
    end
  end
end
