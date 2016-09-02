require "rails_helper"

RSpec.feature "Users can view reports" do
  scenario "with the report details" do
    report = FactoryGirl.create(:report, name: "Jill")

    visit "/"
    click_link "Jill"
    expect(page.current_url).to eq report_url(report)
  end
end
