require "application_system_test_case"

class ShowingsTest < ApplicationSystemTestCase
  setup do
    @showing = showings(:one)
  end

  test "visiting the index" do
    visit showings_url
    assert_selector "h1", text: "Showings"
  end

  test "should create showing" do
    visit showings_url
    click_on "New showing"

    fill_in "Movie", with: @showing.movie_id
    fill_in "Screen", with: @showing.screen_id
    fill_in "Screening time", with: @showing.screening_time
    click_on "Create Showing"

    assert_text "Showing was successfully created"
    click_on "Back"
  end

  test "should update Showing" do
    visit showing_url(@showing)
    click_on "Edit this showing", match: :first

    fill_in "Movie", with: @showing.movie_id
    fill_in "Screen", with: @showing.screen_id
    fill_in "Screening time", with: @showing.screening_time
    click_on "Update Showing"

    assert_text "Showing was successfully updated"
    click_on "Back"
  end

  test "should destroy Showing" do
    visit showing_url(@showing)
    click_on "Destroy this showing", match: :first

    assert_text "Showing was successfully destroyed"
  end
end
