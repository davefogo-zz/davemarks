class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @topic = Topic.find(params[:id])

    @user_bookmarks = @user.bookmarks
    @likes = @user.likes

  end
end
