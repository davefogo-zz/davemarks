class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:index]

  def user_not_authorized
    flash[:alert] = "Access denied. You cannot delete or modify other user's content."
    redirect_to (request.referrer || root_path)
  end
end
