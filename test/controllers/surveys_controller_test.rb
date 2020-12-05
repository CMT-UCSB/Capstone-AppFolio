require 'test_helper'

class SurveysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager = Manager.create!(email: 'test2@gmail.com', password: 'test1234')
    sign_in @manager
    @survey = Survey.create!(time_of_day: '2000-01-01 16:00:00', day_of_week: "monday", isAnonymous: "identifiable", manager: @manager)
  end

  test "manager id should equal" do
    assert_equal @manager.id, @survey.manager.id
  end
end
