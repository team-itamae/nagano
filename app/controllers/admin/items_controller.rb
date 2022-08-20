class Admin::ItemsController < ApplicationController

  def index
    @item = Item.new
    @items = Item.page(params[:page])
  end

  def new
    @item=Item.new
    @genres=Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @item = Item.new
      @genres=Genre.all
      render 'new'
    end
  end

  def show
    @item = Item.find_by(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genres=Genre.all
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to  "/admin/items/#{@item.id}"
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price,:genre_id,:is_active)
  end
end
