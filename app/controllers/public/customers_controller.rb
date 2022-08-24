class Public::CustomersController < Public::ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer=current_customer
  end

  def update
    current_customer.update(customer_params)
    redirect_to customers_path
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name_sei, :name_mei, :kana_sei, :kana_mei, :post_code, :address, :phone_number, :is_deleted)
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:email, :name_sei, :name_mei, :kana_sei, :kana_mei, :post_code, :address, :phone_number, :is_deleted)
  end
end
