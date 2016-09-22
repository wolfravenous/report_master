require "rails_helper"

RSpec.feature "Users can view futures" do
  before do
    biology = FactoryGirl.create(:subject, name: "Biology")
    FactoryGirl.create(:future, subject: biology, title: "Unit7", content: "The content of a future unit for the class.")

    ansci = FactoryGirl.create(:subject, name: "Animal Science")
    FactoryGirl.create(:future, subject: ansci, title: "Unit9", content: "This is the content for what student will complete in Unit 9.")

    visit "/subjects"
  end

  scenario "for a given subject" do
    click_link "Biology"
    expect(page).to have_content "Unit7"
    expect(page).to_not have_content "Unit9"

    click_link "Unit7"
    within("#future h2") do
      expect(page).to have_content "Unit7"
    end

    expect(page).to have_content "The content of a future unit for the class."
  end

  scenario "for a given subject" do
    click_link "Animal Science"
    expect(page).to have_content "Unit9"
    expect(page).to_not have_content "Unit7"

    click_link "Unit9"
    within("#future h2") do
      expect(page).to have_content "Unit9"
    end

    expect(page).to have_content "This is the content for what student will complete in Unit 9."

    click_link "Animal Science"
    expect(page).to have_content "Unit9"

  end
end
