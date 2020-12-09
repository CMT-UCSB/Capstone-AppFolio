include Rails.application.routes.url_helpers

task :send_emails  => [ :environment ] do
  Survey.all.each do |s|
    if (Time.now.strftime("%H") == s.time_of_day.strftime("%H")) && 
      (Time.now.strftime("%A") == s.day_of_week.capitalize) then
        PagesController.send_emails_task(s)
    end
  end
end