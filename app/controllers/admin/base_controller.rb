class Admin::BaseController < ApplicationController
  layout 'application_admin'
  helper_method :current_admin
  helper_method :logged_in?
  before_action :set_admin

  def current_user
    User.find_by(id: session[:admin_id])  
  end

  def logged_in?
    !current_user.nil?  
  end

  def set_admin
    @user = User.new if session[:admin_id].present?.nil?
  end
end