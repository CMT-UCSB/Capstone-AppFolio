require 'test_helper'

class SurveyTest < ActiveSupport::TestCase
  setup do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    sign_in @manager
  end
  
  test "is not valid when empty" do
    survey = Survey.new()
    assert_not survey.save
  end

  test "valid when data is passed" do
    survey = Survey.new(time_of_day: '2000-01-01 16:00:00', day_of_weeks: "monday", isAnonymous: "identifiable", manager: @manager)
    assert survey.save
  end
end
