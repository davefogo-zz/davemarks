#create users

  User.create(
  email: "davefogo@gmail.com",
  password: "password"
  )
#
  User.create(
  email: "david.forrero@gmail.com",
  password: "password"
  )
#
# users = User.all
#
#create topics

title1 = ["Accounting", "Agile", "Bloc", "Business Intelligence", "CSS", "Dev Tools", "Electrical Engineering", "Finance", "General", "Git", "HTML", "HTTP", "Heroku", "Hobby", "Javascript", "Learn", "Networking", "Online Business", "Opportunities"]

title2 = ["Productivity", "RSpec", "Rails", "Ruby", "Technology Research", "Terminal",  "Text Editors","USA","Wellness",  "Windows Server", "iOS",  "ideamos",  "macOS",  "Blog",  "PG",  "Agriculture", "General Programing",  "Math",  "Big Ideas", "General Programming"]

title3 = ["Sent from my iPhone", "Rspec", "Ruby on Rails", "Computer", "Opotunities", "jQuery", "Programming General",  "Angular",  "Text Editor", "Node.JS",  "Node.js",  "Computer General", "Cruelty Free", "Opportunity", "Parenting", "Travel",  "Usa",  "IT",  "Mental Models"]

title4 = ["Life", "Firebase", "Bridge", "API",  "Family", "Credit", "Get a Job", "-Javascript", "Job", "Surveys", "Lifehack", "Pets",  "Test",  "Alt Email",  "Github", "Mac", "Pre-school"]


  title = title1 + title2 + title3 + title4

  title.each do |title|
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
