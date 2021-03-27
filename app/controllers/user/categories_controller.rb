class User::CategoriesController < User::BaseController
  def index
    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
    if params[:id]
      @category = Category.find(params[:id])
      @products = @category.products.where(is_public: true)
    else
      @products = Product.all
    end
  end
end