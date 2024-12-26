require "application_system_test_case"

class FamilymembersTest < ApplicationSystemTestCase
  setup do
    @familymember = familymembers(:one)
  end

  test "visiting the index" do
    visit familymembers_url
    assert_selector "h1", text: "Familymembers"
  end

  test "should create familymember" do
    visit familymembers_url
    click_on "New familymember"

    click_on "Create Familymember"

    assert_text "Familymember was successfully created"
    click_on "Back"
  end

  test "should update Familymember" do
    visit familymember_url(@familymember)
    click_on "Edit this familymember", match: :first

    click_on "Update Familymember"

    assert_text "Familymember was successfully updated"
    click_on "Back"
  end

  test "should destroy Familymember" do
    visit familymember_url(@familymember)
    click_on "Destroy this familymember", match: :first

    assert_text "Familymember was successfully destroyed"
  end
end
