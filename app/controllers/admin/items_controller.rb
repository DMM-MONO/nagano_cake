class Admin::ItemsController < ApplicationController



  def show
  end

  def index
    @items = Item.all
  end

  def new
     @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save!
    redirect_to admin_items_path
  end

  def edit
  end

  def update
  end
private

  def item_params
    params.require(:item).permit(:name, :image, :price, :is_active, :genre_id, :introduction)
  end
end

