class OrderDetail < ApplicationRecord
 belongs_to :order
 belongs_to :item

  enum making_status: {in_possible: 0,awaiting_production: 1,in_production: 2,production_completed: 3}

 def making_statuses
      statuses.keys.map do |s|
        [ApplicationController.helpers.t("making_status.order_detail.#{name.downcase}.#{s}"), s]
      end
 end

 def subtotal
    item.add_tax_price * quantity
 end
end
