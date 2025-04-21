require "test_helper"

class MultiplicationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get multiplication_index_url
    assert_response :success
  end
end
