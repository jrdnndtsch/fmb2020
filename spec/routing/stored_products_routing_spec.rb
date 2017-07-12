require "rails_helper"

RSpec.describe StoredProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stored_products").to route_to("stored_products#index")
    end

    it "routes to #new" do
      expect(:get => "/stored_products/new").to route_to("stored_products#new")
    end

    it "routes to #show" do
      expect(:get => "/stored_products/1").to route_to("stored_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stored_products/1/edit").to route_to("stored_products#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stored_products").to route_to("stored_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stored_products/1").to route_to("stored_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stored_products/1").to route_to("stored_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stored_products/1").to route_to("stored_products#destroy", :id => "1")
    end

  end
end
