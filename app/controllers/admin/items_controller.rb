class Admin::ItemsController < ApplicationController

  def index
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
  end

  def show
  end

  def edit
    @item = Item.find_by(params[:id])
    @genres=Genre.all
  end

  def update
    @item = Item.find_by(params[:id])
    @item.update(item_params)
    redirect_to  "/admin/items/#{@item.id}"
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active)
  end

end
