require 'rails_helper'

RSpec.describe Widget, type: :model do
  context "with 2 or more comments" do
    it "orders them in reverse chronologically" do
      user=User.new(:name=>"alex", :email=>"fafafa@tut.by", :password=>"1234", :password_confirmation=>"1234")
      twit=Twit.create!(:name=>"bob", :body=>"1234")
      comment1=twit.comments.create!(:body=>"Sheesh")
      comment2=twit.comments.create!(:body=>"comment2")
      expect(twit.reload.comments).to eq([comment2,comment1])
    end
  end  
end
