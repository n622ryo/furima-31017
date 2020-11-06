class ItemsController < ApplicationController
  def index
  end

  def new
  end

  private

  def message_params
    params.require(:item).permit(:product, :description, :price, :category_id, :status_id, :burden_id, :area_id, :deliveryday_id, :image).merge(user_id: current_user.id)
  end
end
