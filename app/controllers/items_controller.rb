class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  def index
    # @items = Item.all
    @items = Item.includes(:user).order("created_at DESC")

  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product, :description, :price, :category_id, :status_id, :burden_id, :area_id, :deliveryday_id, :image).merge(user_id: current_user.id)
  end
  
end
