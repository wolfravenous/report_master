require "rails_helper"

RSpec.feature "Users can edit existing reports" do
  before do
    FactoryGirl.create(:subject, name: "Biology")
    FactoryGirl.create(:unit, title: "Unit1", content: "This is the content for unit 1", subject_id: 1)
    FactoryGirl.create(:intro, title: "Regular", content: "This is the content for a regular intro", subject_id: 1)
    # visit "/subjects/1"
    # click_link "New Unit"
    # fill_in "Title", with: "Unit1"
    # fill_in "Content", with: "This is the content for unit 1"
    # click_button "Create Unit"


    FactoryGirl.create(:report, name: "Jimmy", comment: "Some personal Comments", gender: "female", classwork: "88", assessment: "92", participate: "90", subject_id: 1, unit_id: 1, intro_id: 1)

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
