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
      flash[:danger] = 'Invalid email or password.'
      redirect_to user_login_path
    end
  end

  def create_api
    @user = User.find_by(email: params[:email]) 
    if @user && @user.authenticate(params[:password]) && @user.user?
      session[:user_id] = @user.id
      render json: { login: true }
    else
      render json: { login: false }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to user_root_path
  end
end