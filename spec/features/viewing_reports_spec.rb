require "rails_helper"

RSpec.feature "Users can view reports" do
  scenario "with the report details" do
    report = FactoryGirl.create(:report, name: "Jill", comment: "Some personal Comments", gender: "female")

    visit "/"
    click_link "Jill"
    expect(page.current_url).to eq report_url(report)
    expect(page).to have_content "Jill"
    expect(page).to have_content "female"
    expect(page).to have_content "Some personal Comments"


  end
end
