class UsersController < ApplicationController
    
    def new
    end
    
    def edit
       @user = current_user
    end
    
    def update
        @user = current_user
        
        if $shipping_step
            if @user.update_attributes(user_params)
                redirect_to payment_details_path
                $shipping_step = false
            else
                redirect_to shipping_details_path
            end
        end
        
        if $payment_step
            if @user.update(user_params)
                redirect_to confirmation_path
                $payment_step = false
            else
                redirect_to payment_details_path
            end
        end
    end
    
    def shipping_step
        @user = current_user
        $shipping_step = true
    end
    
    def payment_step
        @user = current_user
        $payment_step = true
    end
    
    def confirmation
        @user = current_user
        @order = current_order
        @order_items = @order.order_items
    end
    
    def feedback
       reset_session
       $shipping_step = false
       $payment_step = false
    end
    
    private
    
        def user_params
            params.require(:user).permit(:first_name, :last_name, :email, :address, :city, :zip_code, :bank_code, :card_number)
        end
end