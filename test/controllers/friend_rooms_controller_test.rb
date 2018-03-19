require 'test_helper'

class FriendRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get friend_rooms_show_url
    assert_response :success
  end

end
