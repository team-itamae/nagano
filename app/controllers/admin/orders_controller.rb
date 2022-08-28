class Admin::OrdersController < Admin::ApplicationController
  protect_from_forgery

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirm_payment"
       @order.order_details.each do |order_detail|
         order_detail.making_status = "awaiting_production"
         order_detail.save
        end
    end
    redirect_to admin_order_path
  end


  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :post_code, :name, :status, :shipping_price, :price_all, :customer_id)
  end
end
