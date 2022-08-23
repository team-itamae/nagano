class CartItem < ApplicationRecord
  has_one_attached :image
  belongs_to :item
  belongs_to :customer

  validates :quantity, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}

  def subtotal
    item.add_tax_price * quantity
  end
end
