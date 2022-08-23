class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_details
  has_many :cart_items


  def get_item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/cake_sample.jpg')
      image.attach(io: File.open(file_path), filename: 'cake_sample.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end

  def add_tax_price
    (self.price * 1.08).round
  end

end