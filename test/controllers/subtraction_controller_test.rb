require "test_helper"

class SubtractionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/subtraction"
    assert_response :success
  end
end
