require 'rails_helper'
include Support::Helpers::LoginHelpers

RSpec.describe 'Twits', type: :request do
    # create new twit
    it "creates A twit and redirects to Twit`s page" do
    login_as(user)  
    get "/twits/new"
    expect(response).to render_template(:new)
    post "/twits", :params => { :twit =>{ :name => "bob", :body => "1234"} }
    expect(response.body).to have_http_status(200)

    end
    # check response 
    #expect(response.body).to have_http_status(200)
end