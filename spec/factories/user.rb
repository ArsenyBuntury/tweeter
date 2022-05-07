FactoryBot.define do    
  factory :user do
      name { "Joe" }
      email { "#{first_name}@example.com".downcase }
      password { "1234" }
      password_confirmation { "1234" }
      admin { true }
      activated { true }
    end
  end