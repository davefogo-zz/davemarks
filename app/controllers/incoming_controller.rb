class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.


    # Find the user
     find_user = User.find_by(email: params[:sender])
     # Find the topic
     find_topic = Topic.find_by(title: params[:subject])
     # Assign the url to a variable after retreiving it from
     url = params["body-plain"]

     if user.nil?
       user = User.new(email: find_user, password: "password")
       user.save!
     end

     # If the topic is nil, create and save a new topic

      if topic.nil?
        topic = Topic.new(title: find_topic, user: find_user)
        topic.save!
      end

      bookmark = topic.bookmarks.build(user: find_user, url: url)

      bookmark.save!


    # Assuming all went well.
    head 200
  end
end
