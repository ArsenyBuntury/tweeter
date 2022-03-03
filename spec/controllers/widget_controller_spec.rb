require "rails_helper"
require "support/render_views"

RSpec.describe WidgetsController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  
    render_views
  
    describe "GET index" do
      it "has a widgets related heading" do
        get :index
        expect(response.body).to match /<h1>.*widgets/im
      end
    end
end