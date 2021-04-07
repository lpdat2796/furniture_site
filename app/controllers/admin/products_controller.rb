class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.page(params[:page]).per(25)
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @categories = Category.all
    @product = Product.new(params[:product].permit!)

    if params[:product][:product_images_file_data].nil?
      @categories = Category.all
      flash.now[:danger] = 'Create product failed.'
      @product.errors.add(:product_images_file_data, :blank)
      render :new
      return
    end

    if @product.save
      params[:product][:product_images_file_data].each do |image|
        @product.product_images.create(file_data: image)
      end

      flash[:success] = 'Create product successfully.'
      redirect_to admin_products_path
    else
      @categories = Category.all
      flash.now[:danger] = 'Create product failed.'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(params[:product].permit!)
      if params[:product][:product_images_file_data].present?
        @product.product_images.destroy_all

        params[:product][:product_images_file_data].each do |image|
          @product.product_images.create(file_data: image)
        end
      end

      flash[:success] = 'Update product successfully.'
      redirect_to admin_products_path
    else
      @categories = Category.all
      flash.now[:danger] = 'Update product failed.'
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])

    if @product.destroy
      flash[:success] = 'Delete product successfully.'
      redirect_to admin_products_path
    else
      flash.now[:danger] = 'Delete product failed.'
      render :new
    end
  end
end