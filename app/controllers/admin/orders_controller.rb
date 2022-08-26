class Admin::OrdersController < Admin::ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :post_code, :name, :status, :shipping_price, :price_all, :customer_id)
  end
end
