class Order < ApplicationRecord
  has_one_attached :image
  belongs_to :customer
  has_many :order_details
  has_many :items, through: :order_details

  enum status: {awaiting_payment: 0,confirm_payment: 1,in_production: 2,ship_preparation: 3,shipped: 4}
  enum payment_method: {credit_card: 0,transfer: 1}


    def statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("status.order.#{name.downcase}.#{s}"), s]
      end
    end

  def subtotal
    item.add_tax_price * quantity
  end

end
