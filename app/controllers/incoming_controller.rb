class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.


    # Find the user
     user = User.find_by(email: params[:sender])
     # Find the topic
     topic = Topic.find_by(title: params[:subject])
     # Assign the url to a variable after retreiving it from
     url = params["body-plain"]

     if user.nil?
       new_user = User.new(email: user, password: "password")
       new_user.save!
     end

     # If the topic is nil, create and save a new topic

      if topic.nil?
        new_topic = Topic.new(title: topic, user: user)
        new_topic.save!
        bookmark = new_topic.bookmarks.build(user: user, url: url)
      end

      bookmark = topic.bookmarks.build(user: user, url: url)

      bookmark.save!


    # Assuming all went well.
    head 200
  end
end
