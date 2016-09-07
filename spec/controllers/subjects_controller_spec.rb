require 'rails_helper'

RSpec.describe SubjectsController, type: :controller do
  it "handles a missing subject correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(subjects_path)

    message = "The subject you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end
end
