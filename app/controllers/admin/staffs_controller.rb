class Admin::StaffsController < Admin::BaseController
  def index
    @users = User.where(role: 'admin').order(id: :asc).page(params[:page]).per(25)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user].permit!)

    if @user.save
      flash[:success] = 'Create staff successfully.'
      redirect_to admin_staffs_path
    else
      flash.now[:danger] = 'Create staff failed.'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(params[:user].permit!)
      flash[:success] = 'Update staff successfully.'
      redirect_to admin_staffs_path
    else
      flash.now[:danger] = 'Update staff failed.'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])

    if @user.destroy
      flash[:success] = 'Delete staff successfully.'
      redirect_to admin_staffs_path
    else
      flash.now[:danger] = 'Delete staff failed.'
      render :new
    end
  end
end
