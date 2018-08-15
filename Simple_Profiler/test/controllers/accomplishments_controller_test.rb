require 'test_helper'

class AccomplishmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get accomplishments_show_url
    assert_response :success
  end

  test "should get new" do
    get accomplishments_new_url
    assert_response :success
  end

  test "should get edit" do
    get accomplishments_edit_url
    assert_response :success
  end

end
