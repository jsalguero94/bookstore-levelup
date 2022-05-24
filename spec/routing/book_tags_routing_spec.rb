require "rails_helper"

RSpec.describe BookTagsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/book_tags").to route_to("book_tags#index")
    end

    it "routes to #new" do
      expect(get: "/book_tags/new").to route_to("book_tags#new")
    end

    it "routes to #show" do
      expect(get: "/book_tags/1").to route_to("book_tags#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/book_tags/1/edit").to route_to("book_tags#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/book_tags").to route_to("book_tags#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/book_tags/1").to route_to("book_tags#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/book_tags/1").to route_to("book_tags#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/book_tags/1").to route_to("book_tags#destroy", id: "1")
    end
  end
end
