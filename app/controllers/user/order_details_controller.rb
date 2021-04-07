class User::OrderDetailsController < User::BaseController
  def update
    order_detail = OrderDetail.find(params[:id])
    product = order_detail.product
    value = params[:value].to_i
    product_amount = product.amount.to_i
    order_detail_amount = order_detail.amount.to_i

    if product_amount == 0 && value >= order_detail_amount
      render json: { is_latest_product: true }, status: 200
      return 
    end

    is_latest_product = false

    if params[:type] == 'minus'
      order_detail.update(amount: order_detail_amount - 1)
      product.update(amount: product_amount + 1)
    elsif params[:type] == 'plus'
      order_detail.update(amount: order_detail_amount + 1)
      product.update(amount: product_amount - 1)
    else
      if value >= product_amount
        if product_amount == 0
          product.update(amount: order_detail_amount - value)
          order_detail.update(amount: value)
        else
          order_detail.update(amount: product_amount + order_detail_amount)
          product.update(amount: 0)
        end
      else
        order_detail.update(amount: value)
        product.update(amount: product_amount - value)
      end
    end

    if product.amount == 0
      is_latest_product = true
    end

    render json: { is_latest_product: is_latest_product, amount: order_detail.amount, product_amount: product_amount }, status: 200
  end

  def destroy
    order_detail = OrderDetail.find(params[:id])
    amount = order_detail.amount
    product = order_detail.product
    product.update(amount: product.amount.to_i + amount)

    if amount < 2
      order_detail.order.update(total_amount: 0)
      order_detail.destroy
    else
      order = order_detail.order
      product = order_detail.product
      order.update(total_amount: order.amount.to_i - product.price.to_i)
      order_detail.update(amount: amount - 1)
    end

    redirect_to user_carts_path
  end
end