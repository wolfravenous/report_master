require "rails_helper"

RSpec.feature "Users can create new intros" do
  before do
    subject = FactoryGirl.create(:subject, name: "Biology")

    visit subject_path(subject)
    click_link "New Intro"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Regular"
    fill_in "Content", with: "The regular intro for Biology."
    click_button "Create Intro"

    expect(page).to have_content "Intro has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Intro"

    expect(page).to have_content "Intro has not been created."
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Content can't be blank"
  end

  scenario "when providing invalid attributes" do
    fill_in "Title", with: "Regular"
    fill_in "Content", with: "shrt tex"
    click_button "Create Intro"

    expect(page).to have_content "Intro has not been created."
    expect(page).to have_content "Content is too short"
  end

end
