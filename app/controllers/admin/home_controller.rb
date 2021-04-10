class Admin::HomeController < Admin::BaseController
  def index
    @orders = Order.where.not(status: 'draft')
    @users = User.where(role: 'user')
    @products = Product.all
    
    furniture = Category.find_by(name: 'Furniture', parent_id: 0)
    child_furniture = Category.find_by(name: 'Babies, Children & Teens', parent_id: 0)
    decoration = Category.find_by(name: 'Decoration', parent_id: 0)

    furniture_orders = OrderDetail.joins(:order, product: :categories).where('categories.parent_id LIKE ?', "%0,#{ furniture.id }%").
      where.not(orders: { status: 'draft' }).
      where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).distinct.count
    baby_furniture_orders = OrderDetail.joins(:order, product: :categories).where('categories.parent_id LIKE ?', "%0,#{ child_furniture.id }%").
      where.not(orders: { status: 'draft' }).
      where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).distinct.count
    decorator = OrderDetail.joins(:order, product: :categories).where('categories.parent_id LIKE ?', "%0,#{ decoration.id }%").
      where.not(orders: { status: 'draft' }).
      where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month).distinct.count
    @arr_amount_orders = [furniture_orders, baby_furniture_orders, decorator]

    @arr_total_amounts = []

    for i in 1..12
      @arr_total_amounts << Order.where('extract(month from created_at) = ?', i).where.not(status: ['draft', 'rejected']).pluck(:total_amount).inject { |sum, item| sum.to_i + item.to_i }.to_i
    end
  end
end