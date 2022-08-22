class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
    @order = Order.find_by(params[:id])
    @total = 0
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
    @order = Order.find_by(params[:id])
    @total = 0
  end
end
