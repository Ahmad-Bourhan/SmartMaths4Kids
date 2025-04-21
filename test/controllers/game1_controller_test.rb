require "test_helper"

class Game1ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get game1_index_url
    assert_response :success
  end
end
