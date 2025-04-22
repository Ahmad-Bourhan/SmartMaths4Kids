require "test_helper"

class AdditionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/addition"
    assert_response :success
  end
end
