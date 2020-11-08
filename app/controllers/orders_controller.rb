class OrdersController < ApplicationController
  def index
    @order = Order.new
    @item = Item.find(params[:item_id])
  end

  def new
    @order = Order.new
  end

  def create
    # binding.pry
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order).permit(:post_code, :prefecture_code_id, :city, :house_number, :building_name, :phone_number, :token )
  end

end
