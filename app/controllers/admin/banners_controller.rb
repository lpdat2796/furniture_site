class Admin::BannersController < Admin::BaseController
  def index
    @banners = Banner.order(id: :asc).page(params[:page]).per(25)
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params[:banner].permit!)

    if @banner.save
      flash[:success] = 'Create banner successfully.'
      redirect_to admin_banners_path
    else
      flash.now[:danger] = 'Create banner failed.'
      render :new
    end
  end

  def edit
    @banner = Banner.find(params[:id])
  end

  def update
    @banner = Banner.find(params[:id])

    if @banner.update(params[:banner].permit!)
      flash[:success] = 'Update banner successfully.'
      redirect_to admin_banners_path
    else
      flash.now[:danger] = 'Update banner failed.'
      render :new
    end
  end

  def destroy
    @banner = Banner.find(params[:id])

    if @banner.destroy
      flash[:success] = 'Delete banner successfully.'
      redirect_to admin_banners_path
    else
      flash.now[:danger] = 'Delete banner failed.'
      render :new
    end
  end
end
