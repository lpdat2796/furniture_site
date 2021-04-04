class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.where(status: 'processing')
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])

    if params[:button] == 'reject'
      @order.update(reject_comment: params[:order][:reject_comment], status: 'rejected')
    else
      @order.update(expected_shipment_date: params[:order][:expected_shipment_date], status: 'delivery')
    end

    flash[:success] = 'Update order successfully'
    redirect_to admin_orders_path
  end
end