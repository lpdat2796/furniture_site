class Order < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :order_details
  has_one :order_delivery

  # Validations
  validates :expected_shipment_date, presence: true, if: -> { status == 'delivery' }
  validates :shipment_date, presence: true, if: -> { status == 'completed' }

  def get_color_label
    case status
    when 'processing'
      'label-primary'
    when 'delivery'
      'label-warning'
    when 'complete'
      'label-success'
    when 'canceled'
      'label-danger'
    end
  end
end