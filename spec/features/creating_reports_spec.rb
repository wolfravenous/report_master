require "rails_helper"

RSpec.feature "Users can create new reports" do
  before do
    FactoryGirl.create(:subject, name: "Astronomy")
    # visit "/subjects"
    # click_link "New Subject"
    # fill_in "Name", with: "Astronomy"
    # click_button "Create Subject"

    visit "/"
    click_link "New Report"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Jimmy"
    choose "female"
    select "Astronomy", :from => "Subject"
    fill_in "Comment", with: "Some personal comments about STUDENTNAME"


    click_button "Create Report"
    expect(page).to have_content "Report has been created."

    report = Report.find_by(name: "Jimmy")
    expect(page.current_url).to eq report_url(report)

    title = "Jimmy - Reports - ReportMaster"
    expect(page).to have_title title
  end

  scenario "when providing invalid attributes" do
    click_button "Create Report"
    expect(page).to have_content "Report has not been created."
  end

end
