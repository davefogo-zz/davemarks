class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    authorize @bookmark
    like = current_user.likes.new(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark created successfully."
    else
      flash.now[:alert] = "Bookmark could not be saved. Please try again."
    end
    redirect_to [@bookmark.topic, @bookmark]
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    authorize @bookmark
    like = Like.find(params[:id])

    if like.destroy
      flash[:notice] = "Bookmark deleted."
    else
      flash.now[:alert] = "Bookmark could not be deleted. Please try again."
    end
    redirect_to [@bookmark.topic, @bookmark]
  end
end
