require "rails_helper"

RSpec.feature "Users can create new reports" do
  before do
    FactoryGirl.create(:subject, name: "Biology")
    FactoryGirl.create(:unit, title: "Unit1", content: "This is the content for unit 1", subject_id: 1)
    FactoryGirl.create(:intro, title: "Regular", content: "This is the content for a regular intro", subject_id: 1)
    # visit "/subjects"
    # click_link "New Subject"
    # fill_in "Name", with: "Astronomy"
    # click_button "Create Subject"

    # visit "/subjects/1"
    # click_link "New Unit"
    # fill_in "Title", with: "Unit1"
    # fill_in "Content", with: "This is the content for unit 1"
    # click_button "Create Unit"

    visit "/"
    click_link "New Report"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Jimmy"
    choose "female"
    select "Biology", :from => "Subject"
    select "Unit1", :from => "Unit"
    select "Regular", :from => "Intro"
    fill_in "Classwork", with: "88"
    fill_in "Assessment", with: "92"
    fill_in "Participate", with: "90"
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
