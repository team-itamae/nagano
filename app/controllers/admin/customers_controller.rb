class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.find_by(params[:id])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def customer_params
    params.require(:customer).permit(:email, :name_sei, :name_mei, :kana_sei, :kana_mei, :post_code, :address, :phone_number, :is_deleted)
  end
end
