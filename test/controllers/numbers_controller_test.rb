require "test_helper"

class NumbersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/numbers"
    assert_response :success
  end
end
