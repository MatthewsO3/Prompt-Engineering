require "test_helper"

class ShowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @showing = showings(:one)
  end

  test "should get index" do
    get showings_url
    assert_response :success
  end

  test "should get new" do
    get new_showing_url
    assert_response :success
  end

  test "should create showing" do
    assert_difference("Showing.count") do
      post showings_url, params: { showing: { movie_id: @showing.movie_id, screen_id: @showing.screen_id, screening_time: @showing.screening_time } }
    end

    assert_redirected_to showing_url(Showing.last)
  end

  test "should show showing" do
    get showing_url(@showing)
    assert_response :success
  end

  test "should get edit" do
    get edit_showing_url(@showing)
    assert_response :success
  end

  test "should update showing" do
    patch showing_url(@showing), params: { showing: { movie_id: @showing.movie_id, screen_id: @showing.screen_id, screening_time: @showing.screening_time } }
    assert_redirected_to showing_url(@showing)
  end

  test "should destroy showing" do
    assert_difference("Showing.count", -1) do
      delete showing_url(@showing)
    end

    assert_redirected_to showings_url
  end
end
