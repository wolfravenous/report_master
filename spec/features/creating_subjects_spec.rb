require "rails_helper"

RSpec.feature "Users can create new subjects" do
  scenario "with valid attributes" do

    visit "/subjects"
    click_link "New Subject"

    fill_in "Name", with: "RoR 101"
    click_button "Create Subject"

    expect(page).to have_content "Subject has been created."

    subject = Subject.find_by(name: "RoR 101")
    expect(page.current_url).to eq subject_url(subject)
  end
end
