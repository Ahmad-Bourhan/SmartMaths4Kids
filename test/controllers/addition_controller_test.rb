require "test_helper"

class AdditionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get addition_index_url
    assert_response :success
  end
end
