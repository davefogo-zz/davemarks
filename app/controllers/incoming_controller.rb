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

     bookmark.create!(topic: topic, user: user, url: url)

     # Check if user is nil, if so, create and save a new user

     # Check if the topic is nil, if so, create and save a new topic

     # Now that you're sure you have a valid user and topic, build and save a new bookmark

    # Assuming all went well.
    head 200
  end
end
