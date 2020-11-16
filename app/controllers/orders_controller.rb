class OrdersController < ApplicationController
  def index
    @addressorder = ItemOrder.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @addressorder = ItemOrder.new(address_params)
    if @addressorder.valid?
       @addressorder.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
  def address_params
    params.permit( :postcode, :prefecture_id, :city, :housenum, :buildname, :phonenum).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
