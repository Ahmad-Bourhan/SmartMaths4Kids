require "test_helper"

class ScoresControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
    @score = scores(:one)
  end

  test "should get index" do
    get scores_url
    assert_response :success
  end

  test "should get new" do
    get new_score_url
    assert_response :success
  end

  test "should create score" do
    assert_difference("Score.count") do
      post scores_url, params: {
        score: {
          user_id: @user.id,
          score: 10,
          attempted_at: Time.current
        }
      }
    end

    assert_redirected_to score_url(Score.last)
  end

  test "should show score" do
    get score_url(@score)
    assert_response :success
  end

  test "should get edit" do
    get edit_score_url(@score)
    assert_response :success
  end

  test "should update score" do
    patch score_url(@score), params: {
      score: {
        user_id: @user.id,
        score: 20,
        attempted_at: Time.current
      }
    }
    assert_redirected_to score_url(@score)
  end

  test "should destroy score" do
    assert_difference("Score.count", -1) do
      delete score_url(@score)
    end

    assert_redirected_to scores_url
  end
end
