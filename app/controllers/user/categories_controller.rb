class User::CategoriesController < User::BaseController
  def index
    if params[:id]
      @category = Category.find(params[:id])
      @products = @category.products.where(is_public: true)
    else
      @products = Product.all
    end
  end
end