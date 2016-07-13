class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_action :is_current_user

  private

  def is_current_user
    @current_user = current_user if logged_in?
  end
end
