class Admin::BaseController < ApplicationController
  layout 'application_admin'
  helper_method :current_admin
  helper_method :logged_in?
  before_action :authentication!

  def current_admin
    User.find_by(id: session[:admin_id])  
  end

  def logged_in?
    !current_admin.nil?  
  end

  def authentication!
    if controller_name != 'sessions' && !logged_in?
      redirect_to admin_login_path
    end
  end
end