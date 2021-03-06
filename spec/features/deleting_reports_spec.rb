require "rails_helper"

RSpec.feature "Users can delete reports" do
  scenario "successfully" do
    FactoryGirl.create(:subject, name: "Astronomy")
    FactoryGirl.create(:unit, title: "Unit1", content: "This is the content for unit 1", subject_id: 1)
    FactoryGirl.create(:unit, title: "Unit2", content: "This is the content for unit 2", subject_id: 1)
    FactoryGirl.create(:intro, title: "Regular", content: "This is the content for a regular intro", subject_id: 1)
    FactoryGirl.create(:future, title: "Unit9", content: "This is the content for a future unit", subject_id: 1)

    FactoryGirl.create(:report, name: "Jimmy Jones", comment: "Some personal Comments", gender: "female", classwork: "88", assessment: "92", participate: "90", subject_id: 1, intro_id: 1, initial_id: 1, ending_id: 2, future_id: 1)

    visit "/"
    click_link "Jimmy Jones"
    click_link "Delete Report"

    expect(page).to have_content "Report has been deleted."
    expect(page.current_url). to eq reports_url
    expect(page).to have_no_content "Jimmy Jones"
  end

end
