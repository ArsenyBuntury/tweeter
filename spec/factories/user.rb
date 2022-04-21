FactoryBot.define do    
  factory :user do
      first_name "Joe" 
      last_name "Blow"
      email "#{first_name}.#{last_name}@example.com".downcase
      password "1234"
      password_confirmation "1234"
      admin true
      activated true
    end
  end