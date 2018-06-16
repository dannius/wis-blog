require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get sign_up" do
    get session_sign_up_url
    assert_response :success
  end

  test "should get sign_in" do
    get session_sign_in_url
    assert_response :success
  end

end
