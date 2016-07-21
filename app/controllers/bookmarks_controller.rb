class BookmarksController < ApplicationController

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.topic = @topic

    if @bookmark.save
      flash[:notice] = "Bookmark successfully created."
      redirect_to [@topic, @bookmark]
    else
      flash.now[:alert] = "Bookmark could not be saved. Please try again."
      render :new
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.update_attributes(bookmark_params)

    if @bookmark.save
      flash[:notice] = "Bookmark saved successfully."
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash.now[:alert] = "Bookmark could not be saved. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted successfully."
      redirect_to @bookmark.topic
    else
      flash.now[:alert] = "Bookmark could not be deleted. Try again."
      render :show
    end
  end

  def import
    Bookmark.import(params[:file])
    redirect_to topics_path
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:url, :topic, :user, :description)
  end
end
