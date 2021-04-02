class User::HomeController < User::BaseController
  def index
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
    @new_category = Category.where(name: 'New furniture', parent_id: nil).first
    @new_products = @new_category.products.where(is_public: true)
    @trendy_category = Category.where(name: 'Trendy', parent_id: nil).first
    @trendy_products = @trendy_category.products.where(is_public: true)
    @banners = Banner.where(is_public: true).order(sort_order: :desc).limit(3)
  end
end