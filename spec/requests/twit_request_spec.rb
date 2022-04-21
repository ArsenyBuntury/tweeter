require 'rails_helper'
include Support::Helpers::LoginHelpers

RSpec.describe 'Twits', type: :request do
    it "creates a new user and redirects to twit index path" do
    let(:user) { build(:user, first_name: "Alex")}
    expect(response).to render_template("twits/index")
    end

    it "creates a new twit and redirects to new twit`s path" do
        let(:user) { build(:user, first_name: "Alex")}
        get "twits/new"
        post "/twits", :params => { :twits => { :name => "Alex", :body => "1234" } }
        expect(response).to render_template(:show)
    end

    it "goes to profile page and creates a micropost" do
        let(:user) { build(:user, first_name: "Alex")}
        get "user/show"
        expect(response).to render_template(:show)
        get "/microposts/new"
        post "/microposts", :params => { :micropost => { :content =>"Hi there!" } }
        expect(response).to render_template(:show)
        expect(response).to have_https_status(200)
    end

    
end