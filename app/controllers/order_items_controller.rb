class OrderItemsController < ApplicationController
    before_action :set_current_order
    
    def create
        @user = current_user
       @order_item = @order.order_items.new(order_item_params)
       @order.save!(validate: false)
       session[:order_id] = @order.id
       
       @user.save!(validate: false)
       session[:user_id] = @user.id
       
       @order.update_attribute("user_id", session[:user_id])
       
       redirect_to root_path
    end
    
    def update
       @order_item = @order.order_items.find(params[:id])
       @order_item.update_attributes(order_item_params)
       @order_items = @order.order_items
       
       redirect_to cart_path
    end
    
    def destroy
       @order_item = @order.order_items.find(params[:id])
       @order_item.destroy
       @order_items = @order.order_items
       redirect_to cart_path
    end
    
    private
        
        def order_item_params
           params.require(:order_item).permit(:quantity, :product_id, :price, :order_id)
        end
        
        def set_current_order
            @order = current_order
        end
end
