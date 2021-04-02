class User::AccountsController < User::BaseController
  def profile
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: nil, is_public: true)
  end

  def update_profile
    user = User.find(session[:user_id])
    user.update(params[:user].permit!)
    redirect_to profile_user_accounts_path
  end
end