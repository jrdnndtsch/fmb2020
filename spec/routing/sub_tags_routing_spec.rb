require "rails_helper"

RSpec.describe SubTagsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/sub_tags").to route_to("sub_tags#index")
    end

    it "routes to #new" do
      expect(:get => "/sub_tags/new").to route_to("sub_tags#new")
    end

    it "routes to #show" do
      expect(:get => "/sub_tags/1").to route_to("sub_tags#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/sub_tags/1/edit").to route_to("sub_tags#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/sub_tags").to route_to("sub_tags#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/sub_tags/1").to route_to("sub_tags#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/sub_tags/1").to route_to("sub_tags#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/sub_tags/1").to route_to("sub_tags#destroy", :id => "1")
    end

  end
end
