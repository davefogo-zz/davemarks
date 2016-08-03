class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    authorize @topic
    @topic.user = current_user

    if @topic.save
      flash[:notice] = "Topic created successfully"
      redirect_to @topic
    else
      flash.now[:alert] = "Topic could not be created. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic was updated successfully."
      redirect_to @topic
    else
      flash.now[:alert] = "Error saving topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully. "
      redirect_to topics_path
    else
      flash.now[:alert] = "There was an error deleting the topic."
    end
  end

  def import
    Topic.import(params[:file])
    redirect_to topics_path, notice: "Topics added successfully."
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :user)
  end
end
