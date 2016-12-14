require "rails_helper"

RSpec.feature "Users can view reports" do
  scenario "with the report details" do
    FactoryGirl.create(:subject, name: "Astronomy")
    FactoryGirl.create(:intro, title: "Regular", content: "This is the content for a regular intro", subject_id: 1)
    FactoryGirl.create(:unit, title: "Unit1", content: "This is the content for unit 1", subject_id: 1)
    FactoryGirl.create(:unit, title: "Unit2", content: "This is the content for unit 2", subject_id: 1)
    FactoryGirl.create(:future, title: "Unit9", content: "Content for a future unit", subject_id: 1)

    report = FactoryGirl.create(:report, name: "Jill", comment: "Some Personal Comments", gender: "female", classwork: "83.5", assessment: "83.5", participate: "83.5", subject_id: 1, intro_id: 1, initial_id: 1, ending_id: 2, future_id: 1)

    visit "/"
    click_link "Jill"
    expect(page.current_url).to eq report_url(report)
    expect(page).to have_content "Jill"
    # expect(page).to have_content "female"
    # expect(page).to have_content "Astronomy"
    # expect(page).to have_content "Regular"
    # expect(page).to have_content "Unit1"
    # expect(page).to have_content "Unit9"
    expect(page).to have_content "83"
    expect(page).to have_content "84"
    expect(page).to have_content "Some Personal Comments"


  end
end
