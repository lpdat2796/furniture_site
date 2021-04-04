class User::OrdersController < User::BaseController
  def index
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: 0, is_public: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
    @list_orders = current_user.orders.where.not(status: 'draft')
  end

  def create
    order = current_user.orders.find_by(status: 'draft', uuid: rand.to_s[2..7])

    if order.nil?
      order = current_user.orders.create(status: 'draft')
    end

    product = Product.find(params[:product_id])

    if product.amount < 1
      render json: { can_buy: false }
      return
    else
      product.update(amount: product.amount - 1)
    end

    old_order = order.order_details.find_by(product_id: product.id)

    if old_order.present?
      amount = old_order.amount
      old_order.update(amount: amount + 1)
      total_amount = order.total_amount
      order.update(total_amount: total_amount + product.price)
    else
      order.order_details.create(product_id: product.id)
      order.update(total_amount: product.price)
    end

    render json: { can_buy: true }
  end

  def show
    unless current_user.present?
      redirect_to user_root_path
      return
    end

    @parent_categories = Category.where(name: ['Furniture', 'Baby furniture', 'Decoration'], parent_id: 0, is_public: true)
    @order = current_user.orders.find_by(status: 'draft')
    @order_details = @order&.order_details || []
    @order = Order.where(id: params[:id]).where.not(status: 'draft').first
  end

  def destroy
    order_detail = OrderDetail.find(params[:id])
    amount = order_detail.amount

    if amount < 2
      order_detail.destroy
      redirect_to user_orders_path
    else
      order_detail.update(amount: amount - 1)
    end
  end

  def checkout
    order = Order.find(params[:order_id])
    order.update(status: 'processing')
    OrderDelivery.create(address: params[:address], phone: params[:phone], full_name: params[:full_name], order_id: params[:order_id])
    redirect_to complete_user_carts_path
  end
end