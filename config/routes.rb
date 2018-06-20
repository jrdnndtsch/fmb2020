Rails.application.routes.draw do
  resources :awards
  resources :reports
  resources :sub_tags
  resources :tags
  resources :reviews
  resources :rights_holders
  resources :creators
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
      post 'generate_report' => 'reports#generate_report'
      post 'product_published' => 'products#product_published'
      post 'customer_created' => 'customers#create'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
