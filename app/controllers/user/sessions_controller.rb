class User::SessionsController < User::BaseController
  def new
    redirect_to user_root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_root_path
    else
      flash.now[:danger] = 'Login failed.'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to user_root_path
  end
end