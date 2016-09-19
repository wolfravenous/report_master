require "rails_helper"

RSpec.feature "Users can delete intros" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }
  let(:intro)    { FactoryGirl.create(:intro, subject: subject) }

  before do
    visit subject_intro_path(subject, intro)
  end

  scenario "successfully" do
    click_link "Delete Intro"

    expect(page).to have_content "Intro has been deleted."
    expect(page.current_url).to eq subject_url(subject)
  end
end
