class Admin::HomeController < Admin::BaseController
  def index
    @orders = Order.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    @users = User.where(role: 'user')
    @products = Product.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
    furniture_orders = OrderDetail.joins(product: :categories).where(categories: { name: 'Furniture', parent_id: 0 },
      created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).count
    baby_furniture_orders = OrderDetail.joins(product: :categories).where(categories: { name: 'Baby furniture', parent_id: 0 },
      created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).count
    decorator = OrderDetail.joins(product: :categories).where(categories: { name: 'Decoration', parent_id: 0 },
      created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).count
    @arr_amount_orders = [furniture_orders, baby_furniture_orders, decorator]

    @arr_total_amounts = []

    for i in 1..12
      @arr_total_amounts << Order.where('extract(month from created_at) = ?', i).pluck(:total_amount).inject { |sum, item| sum.to_i + item.to_i }.to_i
    end
  end
end