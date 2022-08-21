class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name_sei, :name_mei, :kana_sei, :kana_mei, :post_code, :address, :phone_number, :is_deleted)
  end
end
