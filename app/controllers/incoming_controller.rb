class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # You put the message-splitting and business
    # magic here.


    # Find the user by using
     user = params[:sender]
     # Find the topic by using
     topic = params[:subject]
     # Assign the url to a variable after retreiving it from
     url = params["body-plain"]

     if curren_user.nil?
       @user = User.create!(email: user, password: "password")
       @user.save!
     end

     # Check if the topic is nil, if so, create and save a new topic
      @topic = Topic.find(params[:subject])

      if @topic.nil?
        @topic = Topic.create!(title: topic)
        @topic.save!
      end

      @bookmark = @topic.bookmarks.build(user: user, url: url)

      @bookmark.save!


    # Assuming all went well.
    head 200
  end
end
