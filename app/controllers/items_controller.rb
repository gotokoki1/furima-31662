class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :condition_id, :postage_id, :prefecture_id, :prepare_day_id, :category_id, :image).merge(user_id: current_user.id)
  end
end
