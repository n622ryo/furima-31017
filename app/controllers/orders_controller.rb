class OrdersController < ApplicationController
  def index
    @addressorder = ItemOrder.new
  end

end
