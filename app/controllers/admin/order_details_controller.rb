class Admin::OrderDetailsController < Admin::ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:order_detail][:order_detail_id])

      if @order_detail.update(order_detail_params)
        if @order_detail.making_status == "in_production" && @order_detail.order.status == "confirm_payment"
           @order_detail.order.update(status: "in_production")

        elsif @order_detail.order.order_details.count == @order_detail.order.order_details.where(making_status: "production_completed").count
              @order_detail.order.update(status: "ship_preparation")
        end
         redirect_to admin_order_path(@order_detail.order.id)
      end
  end


  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :quantity, :making_status)
  end
end

