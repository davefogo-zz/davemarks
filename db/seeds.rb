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
  title: Faker::Hacker.say_something_smart
  )
end

topics = Topic.all

#create bookmarks
50.times do
  Bookmark.create(
  topic: topics.sample,
  url: Faker::Internet.url
  )
end

puts "#{User.count} users created."
puts "#{Topic.count} topics created."
puts "#{Bookmark.count} bookmarks created."
