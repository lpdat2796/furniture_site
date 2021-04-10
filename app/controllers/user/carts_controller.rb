class User::CartsController < User::BaseController
  def index
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(parent_id: 0, is_public: true, is_selected: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
  end

  def complete
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(parent_id: 0, is_public: true, is_selected: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
  end
end