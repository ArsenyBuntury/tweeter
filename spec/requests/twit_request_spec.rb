require 'rails_helper'
require 'spec_helper'
include Helpers

RSpec.describe 'Twits', type: :request do
    describe "creates a new user" do
        let(:user) { build(:user, name: "Alex")}

    it "creates a new user and redirects to twit index path" do
    
    expect(response).to render_template("/twits/index")
    end

    it "creates a new twit and redirects to new twit`s path" do
        
        get "/twits/new"
        post "/twits/new", :params => { :twits => { :name => "Alex", :body => "1234" } }
        get "/twit/show"
        expect(response).to render_template(:show)
    end

    it "goes to profile page and creates a micropost" do
        
        get "/users/show"
        expect(response).to render_template(:show)
        get "/microposts/new"
        post "/microposts", :params => { :micropost => { :content =>"Hi there!" } }
        get :show
        expect(response).to render_template(:show)
        expect(response).to have_https_status(200)
    end
end

    
end