Rails.application.routes.draw do

  namespace :admin do
    get 'making_status/update'
  end
  namespace :admin do
    resources :orders, only: [:show, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
  resources :genres, only: [:index, :edit, :create, :update]
  end

  namespace :admin do
    resources :items, only: [:index, :show, :create, :new, :edit, :update]
  end


    get 'adresses/index' => 'public/adresses#index'
    get 'adresses/edit' => 'public/adresses#edit'
    post 'adresses/create' => 'public/adresses#create'
    patch 'adresses/update' => 'public/adresses#update'
    delete 'adresses/destroy' => 'public/adresses#destroy'

    get 'orders/new' => 'public/orders#new'
    post 'orders/confirm' => 'public/orders#confirm'
    get 'orders/complete' => 'public/orders#complete'
    post 'orders/create' => 'public/orders#create'
    get 'orders/index' => 'public/orders#index'
    get 'orders/show' => 'public/orders#show'

    get 'cart_items/index' => 'public/cart_items#index'
    patch 'cart_items/update' => 'public/cart_items#update'
    delete 'cart_items/destroy' => 'public/cart_items#destroy'
    delete 'cart_items/destroy_all' => 'public/cart_items#destroy_all'
    post 'cart_items/create' => 'public/cart_items#create'


    get 'customers/show' => 'public/customers#show'
    get 'customers/edit' => 'public/customers#edit'
    patch 'customers/update' => 'public/customers#update'
    get 'customers/unsubscribe' => 'public/customers#unsubscribe'
    patch 'customers/withdraw' => 'public/customers#withdraw'

    get 'items/index' => 'public/items#index'
    get 'items/show' => 'public/items/#show'

  get '/' => "public/homes#top"
  get '/about' => "public/homes#about"

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
