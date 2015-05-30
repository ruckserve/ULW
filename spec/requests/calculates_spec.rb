require 'rails_helper'

RSpec.describe "Calculates", type: :request do
  describe "GET /calculates" do
    it "works! (now write some real specs)" do
      get calculates_path
      expect(response).to have_http_status(200)
    end
  end
end
