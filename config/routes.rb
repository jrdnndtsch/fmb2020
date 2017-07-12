Rails.application.routes.draw do
  resources :stored_products
  devise_for :users
  mount ShopifyApp::Engine, at: '/'

  root :to => 'products#index'
  get 'products' => 'products#index'
  post 'products' => 'products#create'


  namespace :api, :defaults => {:format => 'json'} do
    devise_for :users
    namespace :v1 do
      resources :products
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
