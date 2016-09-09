require "rails_helper"

RSpec.feature "Users  can edit existing units" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }

  before do
    visit subject_unit_path(subject, unit)
    click_link "Edit Unit"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Unit-01 Revised"
    click_button "Update Unit"

    expect(page).to have_content "Unit has been updated."

    within("#unit h2") do
      expect(page).to have_content "Unit-01 Revised"
      expect(page).not_to have_content unit.title
    end
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Unit"

    expect(page).to have_content "Unit has not been updated."
  end
end
