require "test_helper"

class DivisionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get division_path
    assert_response :success
  end
end
