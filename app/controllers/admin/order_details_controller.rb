class Admin::OrderDetailsController < Admin::ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    redirect_to admin_order_path(@order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :quantity, :making_status)
  end
end
