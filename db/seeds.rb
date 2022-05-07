#30.times do
  #name = Faker::Hipster.sentence(word_count: 3)
  #body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  #Twit.create name: name, body: body
#end

#30.times do
 # title = Faker::Hipster.word 
 # Tag.create title: title
#end

# Create a main sample user
User.create!(name: "Artur User",
         email: "bob@bob.com",
            password: "1234",
           password_confirmation: "1234",
           admin: true,
            activated: true,
            activated_at: Time.zone.now)

# Create additional users
5.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name: name,
             email: email,
             password: password,
              password_confirmation: password,
              activated: true,
             activated_at: Time.zone.now)
end

# Generate microposts for a subset of users.
users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(word_count: 5)
  users.each { |user| user.microposts.create!(content: content) }
end

# Create following relationships.
users = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }