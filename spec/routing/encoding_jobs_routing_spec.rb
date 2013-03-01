require "spec_helper"

describe EncodingJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/encoding_jobs").should route_to("encoding_jobs#index")
    end

    it "routes to #new" do
      get("/encoding_jobs/new").should route_to("encoding_jobs#new")
    end

    it "routes to #show" do
      get("/encoding_jobs/1").should route_to("encoding_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/encoding_jobs/1/edit").should route_to("encoding_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/encoding_jobs").should route_to("encoding_jobs#create")
    end

    it "routes to #update" do
      put("/encoding_jobs/1").should route_to("encoding_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/encoding_jobs/1").should route_to("encoding_jobs#destroy", :id => "1")
    end

  end
end
