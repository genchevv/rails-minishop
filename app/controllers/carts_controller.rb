class CartsController < ApplicationController
  def show
    @order_items = current_order.order_items
    @order = current_order
  end
  
  def new
    @order_items = current_order.order_items
  end
end
