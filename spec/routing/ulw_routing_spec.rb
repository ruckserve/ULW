require "rails_helper"

RSpec.describe CalculatesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/calculates").to route_to("calculates#index")
    end

    it "routes to #new" do
      expect(:get => "/calculates/new").to route_to("calculates#new")
    end

    it "routes to #show" do
      expect(:get => "/calculates/1").to route_to("calculates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/calculates/1/edit").to route_to("calculates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/calculates").to route_to("calculates#create")
    end

    it "routes to #update" do
      expect(:put => "/calculates/1").to route_to("calculates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/calculates/1").to route_to("calculates#destroy", :id => "1")
    end

  end
end
