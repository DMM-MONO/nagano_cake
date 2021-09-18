class Admin::ItemsController < ApplicationController



  def show
  end

  def index
  end

  def new
     @item = Item.new
   
  end

  def create
    @item = Item.new(item_params)
    @item.admin_id = admin.id
    @item.save
    redirect_to admin_items_path
  end

  def edit
  end

  def update
  end
private

  def item_params
    params.require(:item).permit(:name, :image_id, :price,:is_activ, :genre_id,)
  end
end

