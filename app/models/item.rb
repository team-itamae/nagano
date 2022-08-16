class Item < ApplicationRecord
  has_one_attached :image
  has_many :genres
  belongs_to :order_detail
  belongs_to :cart_item
end
