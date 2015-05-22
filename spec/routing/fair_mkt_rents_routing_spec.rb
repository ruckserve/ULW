require "rails_helper"

RSpec.describe FairMktRentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fair_mkt_rents").to route_to("fair_mkt_rents#index")
    end

    it "routes to #new" do
      expect(:get => "/fair_mkt_rents/new").to route_to("fair_mkt_rents#new")
    end

    it "routes to #show" do
      expect(:get => "/fair_mkt_rents/1").to route_to("fair_mkt_rents#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fair_mkt_rents/1/edit").to route_to("fair_mkt_rents#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fair_mkt_rents").to route_to("fair_mkt_rents#create")
    end

    it "routes to #update" do
      expect(:put => "/fair_mkt_rents/1").to route_to("fair_mkt_rents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fair_mkt_rents/1").to route_to("fair_mkt_rents#destroy", :id => "1")
    end

  end
end
