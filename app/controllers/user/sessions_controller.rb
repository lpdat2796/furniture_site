class User::SessionsController < User::BaseController
  def new
    redirect_to user_root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email]) 
    if @user && @user.authenticate(params[:user][:password]) && @user.user?
      session[:user_id] = @user.id
      redirect_to user_root_path
    else
      flash[:danger] = 'Login failed.'
      redirect_to user_login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_root_path
  end
end