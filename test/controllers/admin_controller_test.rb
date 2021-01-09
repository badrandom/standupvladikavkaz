require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get change" do
    get admin_change_url
    assert_response :success
  end

end
