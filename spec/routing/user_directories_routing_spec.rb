require "rails_helper"

RSpec.describe UserDirectoriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_directories").to route_to("user_directories#index")
    end

    it "routes to #new" do
      expect(:get => "/user_directories/new").to route_to("user_directories#new")
    end

    it "routes to #show" do
      expect(:get => "/user_directories/1").to route_to("user_directories#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_directories/1/edit").to route_to("user_directories#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_directories").to route_to("user_directories#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_directories/1").to route_to("user_directories#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_directories/1").to route_to("user_directories#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_directories/1").to route_to("user_directories#destroy", :id => "1")
    end

  end
end
