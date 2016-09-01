require "rails_helper"

RSpec.feature "Users can create new reports" do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Report"

    fill_in "Name", with: "Student"
    fill_in "Comment", with: "Some personal comments about STUDENTNAME"
    click_button "Create Report"

    expect(page).to have_content "Report has been created."
  end
end
