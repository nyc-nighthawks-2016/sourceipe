class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :is_current_user

  def not_found
    redirect_to '/404'
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out(user)
    session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  private

  def is_current_user
    @current_user = current_user if logged_in?
  end

  def vote_minimum(category)
    category.vote_count * 0.2
  end
  
end
