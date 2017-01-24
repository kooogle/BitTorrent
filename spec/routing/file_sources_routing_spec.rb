require "rails_helper"

RSpec.describe FileSourcesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/file_sources").to route_to("file_sources#index")
    end

    it "routes to #new" do
      expect(:get => "/file_sources/new").to route_to("file_sources#new")
    end

    it "routes to #show" do
      expect(:get => "/file_sources/1").to route_to("file_sources#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/file_sources/1/edit").to route_to("file_sources#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/file_sources").to route_to("file_sources#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/file_sources/1").to route_to("file_sources#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/file_sources/1").to route_to("file_sources#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/file_sources/1").to route_to("file_sources#destroy", :id => "1")
    end

  end
end
