class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(id: :asc).page(params[:page]).per(25)
  end

  def new
    @categories = Category.all
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category].permit!)

    if @category.save
      flash[:success] = 'Create category successfully.'
      redirect_to admin_categories_path
    else
      @categories = Category.all
      flash.now[:danger] = 'Create category failed.'
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
    @categories = Category.where.not(id: @category.id)
    @categories.reject { |item| item.parent_id.include?(@category.id.to_s) }
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(params[:category].permit!)
      flash[:success] = 'Update category successfully.'
      redirect_to admin_categories_path
    else
      @categories = Category.where.not(id: @category.id.to_s)
      @categories.reject { |item| item.parent_id.include?(@category.id.to_s) }
      flash.now[:danger] = 'Update category failed.'
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.products.present?
      flash[:danger] = 'There is product uses this category.'
      redirect_to admin_categories_path
    end

    if @category.destroy
      child_category = Category.where('parent_id LIKE ?', "%#{ @category.id }%")

      child_category.each do |category|
        if category.parent_id.split(',').length > 1
          category.update(parent_id: category.parent_id.split(',').last)
        else
          category.update(parent_id: '0')
        end
      end

      flash[:success] = 'Delete category successfully.'
      redirect_to admin_categories_path
    else
      flash[:danger] = 'Delete category successfully.'
      redirect_to admin_categories_path
    end
  end
end