require "test_helper"

class SurveyAnswersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get survey_answers_index_url
    assert_response :success
  end

  test "should get new" do
    get survey_answers_new_url
    assert_response :success
  end

  test "should get create" do
    get survey_answers_create_url
    assert_response :success
  end

  test "should get show" do
    get survey_answers_show_url
    assert_response :success
  end

  test "should get edit" do
    get survey_answers_edit_url
    assert_response :success
  end

  test "should get update" do
    get survey_answers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get survey_answers_destroy_url
    assert_response :success
  end
end
