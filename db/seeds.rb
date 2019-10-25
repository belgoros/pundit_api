# frozen_string_literal: true

(1..3).each do |x|
  user = User.create!(email: "user-#{x}@example.com", name: "User-#{x}")
  (1..6).each do |i|
    user.posts.create(title: "#{user.name}: Title-#{i}", body: "#{i}-fancy content")
  end
end
