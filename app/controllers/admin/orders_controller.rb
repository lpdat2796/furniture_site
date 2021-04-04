class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.where(status: 'processing')
  end

  def edit
    @order = Order.where(id: params[:id], status: 'processing').first
  end

  def update
    @order = Order.find(params[:id])

    if params[:button] == 'reject'
      @order.update(reject_comment: params[:order][:reject_comment], status: 'rejected', whodunit: current_admin.id, rejected_at: Time.zone.now)
    else
      unless @order.update(expected_shipment_date: params[:order][:expected_shipment_date], status: 'delivery')
        flash.now[:danger] = 'Update order failed'
        render :edit
        return
      end
    end

    flash[:success] = 'Update order successfully'
    redirect_to admin_orders_path
  end

  def rejected_orders
    @orders = Order.where(status: 'rejected')
  end

  def rejected_order_detail
    @order = Order.where(id: params[:id], status: 'rejected').first
  end

  def shipments
    @orders = Order.where(status: 'delivery')
  end

  def shipment_detail
    @order = Order.where(id: params[:id], status: 'delivery').first
  end

  def shipment_detail_update
    @order = Order.find(params[:id])

    if @order.update(expected_shipment_date: params[:order][:shipment_date], status: 'completed')
      flash[:success] = 'Update shipment successfully'
      redirect_to shipments_admin_orders_path
    else
      flash.now[:danger] = 'Update order failed'
      render :shipment_detail
    end
  end
end