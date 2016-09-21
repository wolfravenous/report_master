require "rails_helper"

RSpec.feature "Users can delete futures" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }
  let(:intro)    { FactoryGirl.create(:intro, subject: subject) }
  let(:future)   { FactoryGirl.create(:future, subject: subject) }

  before do
    visit subject_future_path(subject, future)
  end

  scenario "successfully" do
    click_link "Delete Future"

    expect(page).to have_content "Future has been deleted."
    expect(page.current_url).to eq subject_url(subject)
  end
end
