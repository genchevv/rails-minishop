Rails.application.routes.draw do
  root to: 'static#homepage'
  
  get 'orders', to: 'orders#index'
  get 'cart', to: 'carts#show'
  
  get 'shipping-details', to: 'users#shipping_step'
  get 'payment-details', to: 'users#payment_step'
  get 'confirmation', to: 'users#confirmation'
  get 'feedback', to: 'users#feedback'
  
  resources :products
  resources :order_items
  resources :orders
  resources :users
end
