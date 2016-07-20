#create users

  User.create(
  email: "davefogo@gmail.com",
  password: "password"
  )

  User.create(
  email: "david.forrero@gmail.com",
  password: "password"
  )

users = User.all

#create topics
15.times do
  Topic.create(
  title: Faker::Hacker.say_something_smart,
  user: users.sample
  )
end

topics = Topic.all

#create bookmarks
50.times do
  Bookmark.create(
  topic: topics.sample,
  description: Faker::Hipster.sentence,
  url: Faker::Internet.url,
  user: users.sample
  )
end
bookmarks = Bookmark.all

25.times do
  Like.create(
  user: users.sample,
  bookmark: bookmarks.sample
  )
end

puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Like.count} likes created."
puts "#{Bookmark.count} bookmarks created."
