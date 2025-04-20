require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  def setup
    user = User.create!(email: "test@example.com", password: "password")
    @profile = Profile.create!(user_id: user.id, first_name: "Ahmad", last_name: "Test", age: 30)
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should get show" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get new" do
    get new_profile_url
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end
end
