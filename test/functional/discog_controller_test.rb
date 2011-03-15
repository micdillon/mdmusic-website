require 'test_helper'

class DiscogControllerTest < ActionController::TestCase
  test "should get frontend" do
    get :frontend
    assert_response :success
  end

end
