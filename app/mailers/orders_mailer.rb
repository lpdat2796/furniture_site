class OrdersMailer < ApplicationMailer
  def send_processing_mailer(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Order confirmation #{ order.uuid }.")
  end

  def send_delivery_mailer(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Order #{ order.uuid } is ready to be delivered to you.")
  end

  def send_completed_mailer(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Order #{ order.uuid } is completely delivered to you.")
  end

  def send_rejected_mailer(user, order)
    @user = user
    @order = order
    mail(to: user.email, subject: "Order #{ order.uuid } is rejected.")
  end
end