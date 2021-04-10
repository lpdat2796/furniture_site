class User::AccountsController < User::BaseController
  def profile
    if session[:user_id].present?
      @order = current_user.orders.find_by(status: 'draft')
      @order_details = @order&.order_details || []
    else
      @user = User.new
    end

    @parent_categories = Category.where(parent_id: 0, is_public: true, is_selected: true)
  end

  def update_profile
    user = User.find(session[:user_id])
    user.update(params[:user].permit!)
    redirect_to profile_user_accounts_path
  end
end