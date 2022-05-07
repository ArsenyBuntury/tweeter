  module LoginHelpers
   
    def login_as(user)
      post "/session", params: { session: { email: "user.email@bob.com", password: "password" } }
    end
  
  end 

  
  