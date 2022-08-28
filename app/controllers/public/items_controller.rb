class Public::ItemsController < Public::ApplicationController
   skip_before_action :authenticate_customer!


  def index
     @items = Item.all.order('id DESC').page(params[:page]).per(8)
     @item_count = Item.count
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end
end
