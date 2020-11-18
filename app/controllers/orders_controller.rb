class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @addressorder = ItemOrder.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order != nil
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @addressorder = ItemOrder.new(address_params)
    if @addressorder.valid?
      pay_item
      @addressorder.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def address_params
    params.require(:item_order).permit( :postcode, :prefecture_id, :city, :housenum, :buildname, :phonenum).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自分のPAY.JPテスト秘密鍵を記述
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
