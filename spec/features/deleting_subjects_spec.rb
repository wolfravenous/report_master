require "rails_helper"

RSpec.feature "Users can delete projects" do
  scenario "successfully" do
    FactoryGirl.create(:subject, name: "RoR 101")

    visit "/subjects"
    click_link "RoR 101"
    click_link "Delete Subject"

    expect(page).to have_content "Subject has been deleted."
    expect(page.current_url).to eq subjects_url
    expect(page).to have_no_content "RoR 101"
  end
end
