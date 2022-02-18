#30.times do
  #name = Faker::Hipster.sentence(word_count: 3)
  #body = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  #Twit.create name: name, body: body
#end

30.times do
  title = Faker::Hipster.word
  
  Tag.create title: title
end

