class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :authenticate_user!, only: [:create]

  def clean_up(string)
    string.tr!("-- ", "")
  end

  def create
    # Find the user
     user = User.find_by(email: params[:sender])

     # Find the topic
     topic = Topic.find_by(title: params[:subject])

     # Assign the url to a variable after retreiving it from
     url = params["body-plain"]

     description = clean_up(params["stripped-signature"])

     # If the user is nil, create and save a new user
     if user.nil?
       user = User.new(email: params[:sender], password: "password")
       user.save!
     end

     # If the topic is nil, create and save a new topic
      if topic.nil?
        topic = Topic.new(title: params[:subject], user: user)

        topic.save!
      end

      bookmark = topic.bookmarks.build(user: user, url: url, description: description)

      bookmark.save!

    # Assuming all went well.
    head 200
  end
end
