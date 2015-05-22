require "rails_helper"

RSpec.describe FmrDatasetsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fmr_datasets").to route_to("fmr_datasets#index")
    end

    it "routes to #new" do
      expect(:get => "/fmr_datasets/new").to route_to("fmr_datasets#new")
    end

    it "routes to #show" do
      expect(:get => "/fmr_datasets/1").to route_to("fmr_datasets#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fmr_datasets/1/edit").to route_to("fmr_datasets#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fmr_datasets").to route_to("fmr_datasets#create")
    end

    it "routes to #update" do
      expect(:put => "/fmr_datasets/1").to route_to("fmr_datasets#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fmr_datasets/1").to route_to("fmr_datasets#destroy", :id => "1")
    end

  end
end
