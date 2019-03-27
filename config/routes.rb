Rails.application.routes.draw do
  namespace :admin do
    resources :products
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

  resources :cart_items
  namespace :account do
    resources :orders
  end

  devise_for :users
  root "products#index"
end
