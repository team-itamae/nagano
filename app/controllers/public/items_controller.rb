class Public::ItemsController < ApplicationController
  def index
     @items = Item.all.order('id DESC').page(params[:page]).per(8)
  end

  def show
  end
end
