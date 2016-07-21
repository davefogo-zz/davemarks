#create users

  User.create(
  email: "davefogo@gmail.com",
  password: "password"
  )
#
#   User.create(
#   email: "david.forrero@gmail.com",
#   password: "password"
#   )
#
# users = User.all
#
#create topics

  title = ["General", "Git", "Rails", "Ruby", "Javascript", "HTML", "CSS", "Hobby", "USA", "Terminal", "macOS", "iOS", "Networking", "Heroku", "Productivity", "Wellness", "Learn", "Text Editors", "HTTP", "Technology Research", "Accounting", "Agile", "Bloc", "ideamos", "Business Intelligence", "Windows Server", "Finance", "Online Business", "Electrical Engineering", "RSpec", "Opportunities", "Dev Tools" ]

  title.sort.each do |title|
    Topic.create!(title: title, user_id: 1)
  end

# 15.times do
#   Topic.create(
#   title: Faker::Hipster.word,
#   user: users.sample
#   )
# end
#
# topics = Topic.all
#
# #create bookmarks
# 50.times do
#   Bookmark.create(
#   topic: topics.sample,
#   description: Faker::Hipster.sentence,
#   url: Faker::Internet.url,
#   user: users.sample
#   )
# end
# bookmarks = Bookmark.all
#
# 25.times do
#   Like.create(
#   user: users.sample,
#   bookmark: bookmarks.sample
#   )
# end
#
# puts "#{User.count} users created."
# puts "#{Topic.count} topics created."
# puts "#{Like.count} likes created."
# puts "#{Bookmark.count} bookmarks created."
