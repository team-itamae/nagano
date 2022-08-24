class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @addresses=current_customer.addresses
  end

  def confirm
    @cart_items = CartItem.find(params[:cart_item])
    @shipping_price = 800
    # @order = Order.new(order_params)
    # @orders = Order.all
    # @item = Item.find(params[:item_id])
    # @order = @item.order.new(order_params)
  end

  def complete
  end

  def create
    @order = Oder.new(order_params)
    @order.customer_id = current_customer.id
  end

  def index
  end

  def show
    @order = Order.find_by(id: params[:id])
    @total = 0
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :post_code, :name)
  end
end
