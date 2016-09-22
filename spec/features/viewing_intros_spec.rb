require "rails_helper"

RSpec.feature "Users can view intros" do
  before do
    biology = FactoryGirl.create(:subject, name: "Biology")
    FactoryGirl.create(:intro, subject: biology, title: "Regular", content: "The content of regular intro for the class.")

    ansci = FactoryGirl.create(:subject, name: "Animal Science")
    FactoryGirl.create(:intro, subject: ansci, title: "Concluding", content: "This is the concluding intro for the class")

    visit "/subjects"
  end

  scenario "for a given subject" do
    click_link "Biology"
    expect(page).to have_content "Regular"
    expect(page).to_not have_content "Concluding"

    click_link "Regular"
    within("#intro h2") do
      expect(page).to have_content "Regular"
    end

    expect(page).to have_content "The content of regular intro for the class."
  end

  scenario "for a given subject" do
    click_link "Biology"
    expect(page).to have_content "Regular"
    expect(page).to_not have_content "Concluding"

    click_link "Regular"
    within("#intro h2") do
      expect(page).to have_content "Regular"
    end

    expect(page).to have_content "The content of regular intro for the class."

    click_link "Biology"
    expect(page).to have_content "Regular"

  end
end
