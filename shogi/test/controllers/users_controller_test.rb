require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should login" do
    # assert_difference('User.count') do
    #   post :login, :name => @user.name, :room_no => 1
    # end
  end
end
