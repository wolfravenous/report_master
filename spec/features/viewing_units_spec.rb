require "rails_helper"

RSpec.feature "Users can view units" do
  before do
    biology = FactoryGirl.create(:subject, name: "Biology")
    FactoryGirl.create(:unit, subject: biology, title: "Unit-01", content: "The content of first unit.")

    ansci = FactoryGirl.create(:subject, name: "Animal Science")
    FactoryGirl.create(:unit, subject: ansci, title: "Animal Disease", content: "Isn't a joke!")

    visit "/subjects"
  end

  scenario "for a given subject" do
    click_link "Biology"
    expect(page).to have_content "Unit-01"
    expect(page).to_not have_content "Animal Disease"

    click_link "Unit-01"
    within("#unit h2") do
      expect(page).to have_content "Unit-01"
    end

    expect(page).to have_content "The content of first unit."
  end

  scenario "for a given subject" do
    click_link "Biology"
    expect(page).to have_content "Unit-01"
    expect(page).to_not have_content "Animal Disease"

    click_link "Unit-01"
    within("#unit h2") do
      expect(page).to have_content "Unit-01"
    end

    expect(page).to have_content "The content of first unit."

    click_link "Biology"
    expect(page).to have_content "#1"
    
  end
end
