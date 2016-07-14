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

  def merge_sort(list)
    if list.length <= 1
      list
    else
      mid = (list.length / 2).floor
      left = merge_sort(list[0..mid - 1])
      right = merge_sort(list[mid..list.length])
      merge(left, right)
    end
  end

  def merge(left, right)
    if left.empty?
      right
    elsif right.empty?
      left
    elsif left.first < right.first
      [left.first] + merge(left[1..left.length], right)
    else
      [right.first] + merge(left, right[1..right.length])
    end
  end

  def top_recipes(category)



  end

end
