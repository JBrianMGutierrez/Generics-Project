require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get main_home_url
    assert_response :success
  end

  test "should get list_of_users" do
    get main_list_of_users_url
    assert_response :success
  end

end
