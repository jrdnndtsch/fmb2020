require "rails_helper"

RSpec.describe RightsHoldersController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/rights_holders").to route_to("rights_holders#index")
    end

    it "routes to #new" do
      expect(:get => "/rights_holders/new").to route_to("rights_holders#new")
    end

    it "routes to #show" do
      expect(:get => "/rights_holders/1").to route_to("rights_holders#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/rights_holders/1/edit").to route_to("rights_holders#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/rights_holders").to route_to("rights_holders#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/rights_holders/1").to route_to("rights_holders#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/rights_holders/1").to route_to("rights_holders#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/rights_holders/1").to route_to("rights_holders#destroy", :id => "1")
    end

  end
end
