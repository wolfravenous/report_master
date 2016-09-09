require "rails_helper"

RSpec.feature "Users can edit existing reports" do
  before do
    FactoryGirl.create(:subject, name: "Astronomy")
    FactoryGirl.create(:report, name: "Jimmy", comment: "Some personal Comments", gender: "female", classwork: "88", assessment: "92", participate: "90", subject_id: 1)

    visit "/"
    click_link "Jimmy"
    click_link "Edit Report"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Jenny"
    click_button "Update Report"

    expect(page).to have_content "Report has been updated."
    expect(page).to have_content "Jenny"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Report"

    expect(page).to have_content "Report has not been updated."
  end

end
