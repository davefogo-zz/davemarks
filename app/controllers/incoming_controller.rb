class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.


    # Find the user by using
     user = User.find_by(email: params[:sender])
     # Find the topic by using
     topic = Topic.find(params[:subject])
     # Assign the url to a variable after retreiving it from
     url = params["body-plain"]

     if user.nil?
       user = User.new(email: user, password: "password")
       user.save!
     end

     # Check if the topic is nil, if so, create and save a new topic

      if topic.nil?
        topic = Topic.new(title: topic)
        topic.save!
      end

      bookmark = topic.bookmarks.build(user: user, url: url)

      bookmark.save!


    # Assuming all went well.
    head 200
  end
end
