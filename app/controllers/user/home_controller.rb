class User::HomeController < User::BaseController
  def index
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    else
      @user = User.new
    end

    @parent_categories = Category.where(parent_id: 0, is_public: true, is_selected: true)
    @new_category = Category.where(name: 'New furniture', parent_id: 0).first
    @new_products = @new_category.products.where(is_public: true).limit(6)
    @trendy_category = Category.where(name: 'Trendy', parent_id: 0).first
    @trendy_products = @trendy_category.products.where(is_public: true).limit(6)
    @banners = Banner.where(is_public: true).order(sort_order: :desc).limit(3)
  end
end