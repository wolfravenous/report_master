require 'rails_helper'

RSpec.describe ReportsController, type: :controller do
  it "handles a missing report correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(reports_path)

    message = "The report you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

end
