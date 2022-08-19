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
  end

  def update
  end
  
  private
  
  def item_params
    params.require(:item).permit(:image,:name,:introduction,:price,:genre_id,:is_active)
  end
end
