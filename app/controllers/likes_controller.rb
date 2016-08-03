class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.new(bookmark: @bookmark)
    authorize like

    if like.save
      flash[:notice] = "Bookmark liked."
    else
      flash.now[:alert] = "Bookmark could not be liked. Please try again."
    end
    redirect_to [@bookmark.topic, @bookmark]
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    authorize like

    if like.destroy
      flash[:notice] = "Bookmark unliked."
    else
      flash.now[:alert] = "Bookmark could not be unliked. Please try again."
    end
    redirect_to [@bookmark.topic, @bookmark]
  end
end
