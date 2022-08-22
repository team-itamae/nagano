class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details
  has_many :cart_items

  enum is_active: {Available: true, Invalid: false}

def add_tax_price
   (self.price * 1.10).round
end



end