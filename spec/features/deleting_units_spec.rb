require "rails_helper"

RSpec.feature "Users can delete tickets" do
  let(:subject)  { FactoryGirl.create(:subject) }
  let(:unit)     { FactoryGirl.create(:unit, subject: subject) }

  before do
    visit subject_unit_path(subject, unit)
  end

  scenario "successfully" do
    click_link "Delete Unit"

    expect(page).to have_content "Unit has been deleted."
    expect(page.current_url).to eq subject_url(subject)
  end
end
