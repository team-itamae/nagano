
class Public::OrdersController < Public::ApplicationController

  before_action :authenticate_customer!

  def new
    @order=Order.new
    @addresses=current_customer.addresses
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)

    if params[:order][:select_address] == "0"
        @order.post_code = current_customer.post_code
        @order.address = current_customer.address
        @order.name = current_customer.name_sei + current_customer.name_mei

        # collection.selectであれば
        elsif params[:order][:select_address] == "1"
        ship = Address.find(params[:order][:address_id])
        @order.post_code = ship.post_code
        @order.address = ship.address
        @order.name = ship.name

        # 新規住所入力であれば
        elsif params[:order][:select_address] = "2"
        @order.post_code = params[:order][:post_code]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]

        else
            render 'new'
    end


  end

  def complete
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

        # order_detailの保存
        current_customer.cart_items.each do |cart_item| #カートの商品を1つずつ取り出しループ
          @order_detail = OrderDetail.new #初期化宣言
          @order_detail.order_id =  @order.id #注文商品に注文idを紐付け
          @order_detail.item_id = cart_item.item_id #商品idを注文商品idに代入
          @order_detail.quantity = cart_item.quantity #商品の個数を注文商品の個数に代入
          @order_detail.price = (cart_item.item.price*1.1).floor #消費税込みに計算して代入
          @order_detail.save #注文商品を保存
        end #ループ終わり

        current_customer.cart_items.destroy_all #カートの中身を削除
        redirect_to orders_complete_path
  end


  def index
    @orders = Order.all

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :address, :post_code, :name, :status, :shipping_price, :price_all)
  end
end
