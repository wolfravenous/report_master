require "rails_helper"

RSpec.feature "Users can edit existing subjects" do
  before do
    FactoryGirl.create(:subject, name: "RoR 101")

    visit "/subjects"
    click_link "RoR 101"
    click_link "Edit Subject"
  end

  scenario  "with valid attributes" do
    fill_in "Name", with: "RoR 202"
    click_button "Update Subject"

    expect(page).to have_content "Subject has been updated."
    expect(page).to have_content "RoR 202"
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Subject"

    expect(page).to have_content "Subject has not been updated."
  end

end
