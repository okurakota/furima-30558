Rails.application.routes.draw do
  get 'purchases/index'
  devise_for :users
  root to: 'products#index'
  resources :products do
   resources :purchases
  end
end
