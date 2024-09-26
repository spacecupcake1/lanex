require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_response :success
  end

  test "should filter lessons" do
    get root_url, params: { teaching_language: 'English', known_language: 'Spanish', level: 'Beginner' }
    assert_response :success
    assert_not_nil assigns(:lessons)
    # Add more specific assertions based on your filtering logic
  end
end