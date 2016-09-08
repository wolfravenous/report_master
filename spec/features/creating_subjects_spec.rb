require "rails_helper"

RSpec.feature "Users can create new subjects" do
  before do
    visit "/subjects"
    click_link "New Subject"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "RoR 101"
    click_button "Create Subject"

    expect(page).to have_content "Subject has been created."

    subject = Subject.find_by(name: "RoR 101")
    expect(page.current_url).to eq subject_url(subject)

    title = "RoR 101 - Subjects - ReportMaster"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Subject"

    expect(page).to have_content "Subject has not been created."
    expect(page).to have_content "Name can't be blank"
  end

end
