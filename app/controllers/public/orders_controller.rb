class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
    @addresses=current_customer.addresses
  end

  def confirm
    @order = Order.find_by(params[:id])
    @total = 0
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
    @order = Order.find_by(params[:id])
    @total = 0
  end
  
  private
    
  def order_params
    params.require(:order).permit(:payment_method, :address, :post_code, :name)
  end
end
