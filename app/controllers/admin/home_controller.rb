class Admin::HomeController < Admin::BaseController
  def index
    @orders = Order.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    @users = User.where(role: 'user')
    @products = Product.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  end
end