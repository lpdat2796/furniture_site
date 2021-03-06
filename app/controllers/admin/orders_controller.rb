class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.where(status: 'processing').order(id: :asc).page(params[:page]).per(25)
  end

  def edit
    @order = Order.where(id: params[:id], status: 'processing').first
  end

  def update
    @order = Order.find(params[:id])

    if params[:button] == 'reject'
      @order.update(reject_comment: params[:order][:reject_comment], status: 'rejected', whodunit: current_admin.id, rejected_at: Time.zone.now)

      @order.order_details.each do |detail|
        product = detail.product
        product.amount = product.amount.to_i + detail.amount.to_i
        product.save
      end
      OrdersMailer.send_rejected_mailer(@order.user, @order).deliver_now
    else
      unless @order.update(expected_shipment_date: params[:order][:expected_shipment_date], status: 'delivery')
        flash.now[:danger] = 'Update order failed'
        render :edit
        return
      else
        OrdersMailer.send_delivery_mailer(@order.user, @order).deliver_now
      end
    end

    flash[:success] = 'Update order successfully'
    redirect_to admin_orders_path
  end

  def rejected_orders
    @orders = Order.where(status: 'rejected').order(id: :asc).page(params[:page]).per(25)
  end

  def rejected_order_detail
    @order = Order.where(id: params[:id], status: 'rejected').first
  end

  def shipments
    @orders = Order.where(status: 'delivery').order(id: :asc).page(params[:page]).per(25)
  end

  def shipment_detail
    @order = Order.where(id: params[:id], status: 'delivery').first
  end

  def shipment_detail_update
    @order = Order.find(params[:id])

    if @order.update(shipment_date: params[:order][:shipment_date], status: 'completed')
      OrdersMailer.send_completed_mailer(@order.user, @order).deliver_now
      flash[:success] = 'Update shipment successfully'
      redirect_to shipments_admin_orders_path
    else
      flash.now[:danger] = 'Update order failed'
      render :shipment_detail
    end
  end

  def completed_orders
    @orders = Order.where(status: 'completed').order(id: :asc).page(params[:page]).per(25)
  end

  def completed_order_detail
    @order = Order.where(id: params[:id], status: 'completed').first
  end
end