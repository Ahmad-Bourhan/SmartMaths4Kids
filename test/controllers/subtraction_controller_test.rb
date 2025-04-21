require "test_helper"

class SubtractionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subtraction_index_url
    assert_response :success
  end
end
