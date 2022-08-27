class Public::CartItemsController < Public::ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @cart_item_price = 0
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    if @cart_item.update(cart_item_params)
      # indexにリダイレクト
      redirect_to cart_items_path
    else
      @cart_items = current_customer.cart_items.all
      render :index
    end
  end

  def destroy
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.destroy
    @cart_items = current_customer.cart_items.all
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_items = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    # redirect_to cart_items_path

      if @cart_items.present?
            @cart_items.quantity += params[:cart_item][:quantity].to_i
            @cart_item.save
            redirect_to cart_items_path

      elsif @cart_item.save
            @cart_items = current_customer.cart_items.all
            redirect_to cart_items_path
      else
            render 'index'
      end

  end


private
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :quantity)
    end
end
