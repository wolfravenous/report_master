require "rails_helper"

RSpec.feature "Users can create new futures" do
  before do
    subject = FactoryGirl.create(:subject, name: "Biology")

    visit subject_path(subject)
    click_link "New Future"
  end

  scenario "with valid attributes" do
    fill_in "Title", with: "Unit10"
    fill_in "Content", with: "The content for the tenth unit in future tense."
    click_button "Create Future"

    expect(page).to have_content "Future has been created."
  end

  scenario "when providing invalid attributes" do
    click_button "Create Future"

    expect(page).to have_content "Future has not been created."
    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Content can't be blank"
  end

  scenario "when providing invalid attributes" do
    fill_in "Title", with: "Regular"
    fill_in "Content", with: "shrt tex"
    click_button "Create Future"

    expect(page).to have_content "Future has not been created."
    expect(page).to have_content "Content is too short"
  end

end
