class User::RegistrationsController < User::BaseController
  def new
    redirect_to user_root_path if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit!)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_root_path
    else
      flash.now[:danger] = 'Register account failed.'
      render :new
    end
  end
end