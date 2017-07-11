class StaticController < ApplicationController
    def homepage
        @products = Product.all
        @order_item = current_order.order_items.new
    end
end