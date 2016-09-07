require "rails_helper"

RSpec.feature "Users can view subjects" do
  scenario "with the subject details" do
    subject = FactoryGirl.create(:subject, name: "RoR 101")

    visit "/subjects"
    click_link "RoR 101"

    expect(page.current_url).to eq subject_url(subject)
  end
end
