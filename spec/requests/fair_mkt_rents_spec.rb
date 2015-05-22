require 'rails_helper'

RSpec.describe "FairMktRents", type: :request do
  describe "GET /fair_mkt_rents" do
    it "works! (now write some real specs)" do
      get fair_mkt_rents_path
      expect(response).to have_http_status(200)
    end
  end
end
