class OrdersController < ApplicationController
    
    def index
       @orders = Order.all
       @users = User.all
    end
    
    def update
        @order = current_order
        @user = current_user
        @order.update_attributes(order_params)
        @order.save
        
        redirect_to shipping_details_path
    end
    
    def shipping_details
        @order = current_order
    end
    
    def payment_details
        @order = current_order
    end
    
    def final_details
        @order = current_order
    end
    
    def ready
        reset_session
        redirect_to root_path
    end
    
    private
    
        def order_params
            params.require(:order).permit(:total_price, :user_id)
        end
end
