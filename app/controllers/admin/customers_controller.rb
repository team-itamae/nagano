class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_order_path
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name_sei, :name_mei, :kana_sei, :kana_mei, :post_code, :address, :phone_number, :is_deleted)
  end
end
