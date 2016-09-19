require "rails_helper"

RSpec.feature "Users  can edit existing intros" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }
  let(:intro)    { FactoryGirl.create(:intro, subject: subject) }

  before do
    visit subject_intro_path(subject, intro)
    click_link "Edit Intro"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Concluding"
    click_button "Update Intro"

    expect(page).to have_content "Intro has been updated."

    within("#intro h2") do
      expect(page).to have_content "Concluding"
      expect(page).not_to have_content unit.title
    end
  end

  scenario "with invalid attributes" do
    fill_in "Title", with: ""
    click_button "Update Intro"

    expect(page).to have_content "Intro has not been updated"
  end
end
