require 'test_helper'

class GuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get add_to_db" do
    get guests_add_to_db_url
    assert_response :success
  end

end
