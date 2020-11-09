class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user_item, only: [:index, :create]
  before_action :move_to_index
  before_action :move_to_top

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order).permit(:post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :token).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def set_user_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],   
        currency: 'jpy'              
      )
  end

  def move_to_index
    if current_user.id == @item.user_id
     redirect_to root_path
    end
  end

  def move_to_top
    if @item.item_user.present?
     redirect_to root_path
    end
  end
end
