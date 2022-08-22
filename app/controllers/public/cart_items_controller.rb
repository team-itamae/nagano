class Public::CartItemsController < ApplicationController
  
  def index
    @cart_items = cart_items.all
  end

  def update
  end

  def destroy
  end

  def destroy_all
  end

  def create
        @cart_item = cart_items.new(cart_item_params)
 
        if cart_items.find_by(item_id: params[:cart_item][:item_id]).present?

            cart_item = cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item.quantity += params[:cart_item][:quantity].to_i

            cart_item.save
            redirect_to cart_items_path

        elsif @cart_item.save
            　@cart_items = cart_items.all
            　render 'index'
        else　
              render 'index'
        end
  end
  
  
private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :price, :quantity)
    end
end