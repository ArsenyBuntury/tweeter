require 'rails_helper'

RSpec.describe 'Twits', type: :request do
    describe 'GET #index' do
      before(:example) { get twits_path }  
      it "is a success" do
        expect(response).to have_http_status(:ok)
      end
      it "creates a Twit and redirects to the Twit's page" do
        get "/twits/new"
        expect(response).to render_template(:new)
    
        post "/twits", :params => { :twit => {:name => "My Widget", :body => "123"} }
    
        expect(response).to redirect_to(assigns(:twit))
        follow_redirect!
    
        expect(response).to render_template(:show)
        expect(response.body).to include("Twit was successfully created.")
      end
    
      it "does not render a different template" do
        get "/twits/new"
        expect(response).to_not render_template(:show)
      end

    end
end