class User < ActiveRecord::Base
    has_many :orders
    
    validates_presence_of :first_name, :last_name, :email, :address, :city, :zip_code, if: Proc.new{$shipping_step}
    validates :bank_code, presence: true, length: { minimum: 5 }, if: Proc.new{$payment_step}
    validates :card_number, presence: true, length: { minimum: 10 }, if: Proc.new{$payment_step}
    
end