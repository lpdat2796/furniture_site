class Admin::SessionsController < Admin::BaseController
  def new
    redirect_to admin_root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(params[:user][:password]) && @user.admin?
      flash[:success] = 'Login sucessfully.'
      session[:admin_id] = @user.id
      redirect_to admin_root_path
    else
      flash[:danger] = 'Invalid email or password.'
      redirect_to admin_login_path
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to admin_login_path
  end
end