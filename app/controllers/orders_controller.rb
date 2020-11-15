class OrdersController < ApplicationController
  def index
    @addressorder = ItemOrder.new
    @item = Item.find(params[:item_id])
  end

end
