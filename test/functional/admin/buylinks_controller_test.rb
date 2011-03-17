require 'test_helper'

class Admin::BuylinksControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
