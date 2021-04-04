class User::CartsController < User::BaseController
  def index
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: 0, is_public: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
  end

  def complete
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: 0, is_public: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
  end
end