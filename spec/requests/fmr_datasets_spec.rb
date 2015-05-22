require 'rails_helper'

RSpec.describe "FmrDatasets", type: :request do
  describe "GET /fmr_datasets" do
    it "works! (now write some real specs)" do
      get fmr_datasets_path
      expect(response).to have_http_status(200)
    end
  end
end
