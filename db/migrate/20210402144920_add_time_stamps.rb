class AddTimeStamps < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :banners, default: Time.zone.now
    add_timestamps :order_deliveries, default: Time.zone.now
    add_timestamps :order_details, default: Time.zone.now
    add_timestamps :orders, default: Time.zone.now
  end
end
