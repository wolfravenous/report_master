require "rails_helper"

RSpec.feature "Users can delete reports" do
  scenario "successfully" do
    FactoryGirl.create(:subject, name: "Astronomy")
    FactoryGirl.create(:report, name: "Jimmy Jones", comment: "Some personal Comments", gender: "female", classwork: "88", assessment: "92", participate: "90", subject_id: 1)

    visit "/"
    click_link "Jimmy Jones"
    click_link "Delete Report"

    expect(page).to have_content "Report has been deleted."
    expect(page.current_url). to eq reports_url
    expect(page).to have_no_content "Jimmy Jones"
  end

end
