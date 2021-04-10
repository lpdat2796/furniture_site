class User::CategoriesController < User::BaseController
  def index
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    else
      @user = User.new
    end

    @parent_categories = Category.where(parent_id: 0, is_public: true, is_selected: true)
    if params[:id]
      @category = Category.find(params[:id])
      @products = @category.products.where(is_public: true).page(params[:page]).per(9)
    else
      @products = Product.where('name LIKE ?', "%#{ params[:search] }%").page(params[:page]).per(9)
    end
  end
end