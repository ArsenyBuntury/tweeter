require 'factory_bot'

RSpec.describe "Microposts", type: :request do
    let(:user) { create( :user )  } 
    let(:micropost) { create( :micropost )  } 
 
  describe "user should create micropost" do 
    let(:user) { create( :user, first_name: "John", last_name: "Bravo", password: "1234", password_confirmation:"1234", admin: true, activated: true )  } 
    expect(user.name).to eql("Joe")  
  end
end

