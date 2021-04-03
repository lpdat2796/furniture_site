class Admin::UsersController < Admin::BaseController
  def index
    @users = User.where(role: 'user')
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit!)

    if @user.save
      flash[:success] = 'Create user successfully.'
      redirect_to admin_users_path
    else
      flash.now[:danger] = 'Create user failed.'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit!)
      flash[:success] = 'Update user successfully.'
      redirect_to admin_users_path
    else
      flash.now[:danger] = 'Update user failed.'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = 'Delete user successfully.'
      redirect_to admin_users_path
    else
      flash.now[:danger] = 'Delete user failed.'
      render :new
    end
  end
end
