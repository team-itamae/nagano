class Admin::MakingStatusController < Admin::ApplicationController
   def update
    @making_status = MakingStatus.find(params[:id])
    @making_status.update(order_detail_params)
    redirect_to admin_order_path
   end


  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :price, :quantity, :making_status)
  end
end
