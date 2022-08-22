class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    #@item = Item.find(params[:id])
    @cart_item_price = 0
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
  end
end
