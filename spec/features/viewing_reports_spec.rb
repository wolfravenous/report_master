require "rails_helper"

RSpec.feature "Users can view reports" do
  scenario "with the report details" do
    report = FactoryGirl.create(:report, name: "Student Name")

    visit "/"
    click_link "Student Name"
    expect(page.current_url).to eq report_url(report)
  end
end
