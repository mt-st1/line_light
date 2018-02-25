require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:user1)
  end

  test "should get index" do
    sign_in(@user)
    get root_path
    assert_response :success
    sign_out(@user)
    get root_path
    assert_response :success
  end

  test "should get home when user login" do
    sign_in(@user)
    get home_path
    assert_response :success
  end

  test "should redirect home when user not login" do
    sign_out(@user)
    get home_path
    assert_redirected_to new_user_session_url
  end

  test "should be links to signup & login when not login" do
    get root_path
    assert_response :success
    assert_select "a[href=?]", new_user_registration_path
    assert_select "a[href=?]", new_user_session_path
  end

  test "should be links to edit & logout when login" do
    sign_in(@user)
    get root_path
    assert_response :success
    assert_select "a[href=?]", edit_user_registration_path
    assert_select "a[href=?]", destroy_user_session_path
  end

end
