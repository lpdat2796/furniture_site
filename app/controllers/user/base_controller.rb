class User::BaseController < ApplicationController
  layout 'application_user'
  helper_method :current_user
  helper_method :logged_in?
  before_action :set_user

  def current_user
    User.find_by(id: session[:user_id])  
  end

  def logged_in?
    !current_user.nil?  
  end

  def set_user
    @user = User.new if session[:user_id].present?.nil?
  end
end