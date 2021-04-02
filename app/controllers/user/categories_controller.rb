class User::CategoriesController < User::BaseController
  def index
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
    if params[:id]
      @category = Category.find(params[:id])
      @products = @category.products.where(is_public: true)
    else
      @products = Product.all
    end
  end
end