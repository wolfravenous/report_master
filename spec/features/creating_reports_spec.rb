require "rails_helper"

RSpec.feature "Users can create new reports" do
  before do
    visit "/"
    click_link "New Report"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Student"
    fill_in "Comment", with: "Some personal comments about STUDENTNAME"
    click_button "Create Report"
    expect(page).to have_content "Report has been created."

    report = Report.find_by(name: "Student")
    expect(page.current_url).to eq report_url(report)

    title = "Student - Reports - ReportMaster"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Report"
    expect(page).to have_content "Report has not been created."
    expect(page).to have_content "Name can't be blank"
  end

end
