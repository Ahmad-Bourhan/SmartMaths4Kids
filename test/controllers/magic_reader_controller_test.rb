require "test_helper"

class MagicReaderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get magic_reader_path
    assert_response :success
  end
end
