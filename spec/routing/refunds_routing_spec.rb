require "spec_helper"

describe RefundsController do
  describe "routing" do

    it "routes to #index" do
      get("/refunds").should route_to("refunds#index")
    end

    it "routes to #new" do
      get("/refunds/new").should route_to("refunds#new")
    end

    it "routes to #show" do
      get("/refunds/1").should route_to("refunds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/refunds/1/edit").should route_to("refunds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/refunds").should route_to("refunds#create")
    end

    it "routes to #update" do
      put("/refunds/1").should route_to("refunds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/refunds/1").should route_to("refunds#destroy", :id => "1")
    end

  end
end
