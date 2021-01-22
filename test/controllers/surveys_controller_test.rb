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

  end

  test "should get index" do
    get surveys_url
    assert_response :success
  end

  test "should get new" do
    get new_survey_url
    assert_response :success
  end

  test "should create survey" do
    assert_difference('Survey.count') do
      post surveys_url, params: { survey: {  } }
    end

    assert_redirected_to survey_url(Survey.last)
  end

  test "should show survey" do
    get survey_url(@survey)
    assert_response :success
  end

  test "should get edit" do
    get edit_survey_url(@survey)
    assert_response :success
  end

  test "should update survey" do
    patch survey_url(@survey), params: { survey: {  } }
    assert_redirected_to survey_url(@survey)
  end

  test "should destroy survey" do
    assert_difference('Survey.count', -1) do
      delete survey_url(@survey)
    end

    assert_redirected_to surveys_url
  end
end
