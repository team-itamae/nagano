class Admin::ItemsController < ApplicationController

  def index
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
    params.require(:item).permit(:image,:name,:introduction,:price,:genre_id,:is_active)
  end
end
