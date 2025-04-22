require "test_helper"

class MultiplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/multiplication"
    assert_response :success
  end
end
