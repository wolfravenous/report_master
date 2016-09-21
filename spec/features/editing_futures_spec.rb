require "rails_helper"

RSpec.feature "Users  can edit existing intros" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }
  let(:intro)    { FactoryGirl.create(:intro, subject: subject) }
  let(:future)    { FactoryGirl.create(:future, subject: subject) }

  before do
    visit subject_future_path(subject, future)
    click_link "Edit Future"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Unit8"
    click_button "Update Future"

    expect(page).to have_content "Future has been updated."

    within("#future h2") do
      expect(page).to have_content "Unit8"
      expect(page).not_to have_content future.title
    end
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Future"

    expect(page).to have_content "Future has not been updated"
  end
end
