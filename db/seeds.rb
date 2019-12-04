# frozen_string_literal: true

Framework.create(name: "Ruby on Rails")
Framework.create(name: "Bootstrap")
Framework.create(name: "Foundation")
Framework.create(name: "Tapestry")
Framework.create(name: "Struts-2")

frameworks = Framework.all

(1..3).each do |x|
  user = User.create!(email: Faker::Internet.email, name: Faker::Internet.username)
  (1..6).each do |i|
    user.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, framework: frameworks.sample)
  end
end
