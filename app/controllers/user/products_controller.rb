class User::ProductsController < User::BaseController
  def show
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    else
      @user = User.new
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: 0, is_public: true)
    if params[:category_id].to_i > 0
      @category = Category.find(params[:category_id])
    end

    @product = Product.find(params[:id])
    @images = @product.product_images.order(sort_order: :desc)
    @related_products = Product.joins(:categories).where(categories: { id: @product.categories.ids }).where.not(id: @product.id).distinct
  end
end