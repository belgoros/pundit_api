# frozen_string_literal: true

Framework.create(name: "Ruby on Rails")
Framework.create(name: "Bootstrap")
Framework.create(name: "Foundation")
Framework.create(name: "Tapestry")
Framework.create(name: "Struts-2")

frameworks = Framework.all

admin = User.create(email: Faker::Internet.email, name: Faker::Internet.username, role: :admin)
(1..3).each do |i|
  admin.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, framework: frameworks.sample)
end

national = User.create(email: Faker::Internet.email, name: Faker::Internet.username, role: :national)
(1..3).each do |i|
  national.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, framework: frameworks.sample)
end

local = User.create(email: Faker::Internet.email, name: Faker::Internet.username, role: :local)
(1..3).each do |i|
  local.posts.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, framework: frameworks.sample)
end

