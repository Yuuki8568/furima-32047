class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  def index
    # @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item.user_id)
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :price, :description, :condition_id, :category_id, :shipping_area_id, :postage_type_id, :preparation_day_id, :image).merge(user_id: current_user.id)
  end

end
