require "rails_helper"

RSpec.feature "Users can view reports" do
  scenario "with the report details" do
    FactoryGirl.create(:subject, name: "Astronomy")
    FactoryGirl.create(:unit, title: "Unit1", content: "This is the content for unit 1")

    report = FactoryGirl.create(:report, name: "Jill", comment: "Some personal Comments", gender: "female", classwork: "90", assessment: "80", participate: "70", subject_id: 1, unit_id: 1)

    visit "/"
    click_link "Jill"
    expect(page.current_url).to eq report_url(report)
    expect(page).to have_content "Jill"
    expect(page).to have_content "female"
    expect(page).to have_content "Astronomy"
    expect(page).to have_content "90"
    expect(page).to have_content "80"
    expect(page).to have_content "70"
    expect(page).to have_content "83.0"
    expect(page).to have_content "Some personal Comments"


  end
end
