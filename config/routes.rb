Rails.application.routes.draw do
  namespace :public do
    # get 'adresses/index' => "/adresses"
    # get 'adresses/edit' => "/adresses/:id/edit"
    # get 'adresses/create' => "/adresses"
    # get 'adresses/update' => "/adresses/:id"
    # get 'adresses/destroy' => "/adresses/:id"
    resources :adresses, only:[:index, :create, :edit, :update, :destroy]
  end

  namespace :public do
    # get 'orders/new' => "/orders/new"
    get '/orders/confirm' => "orders#confirm"
    get '/orders/complete' => "orders#complete"
    # get 'orders/create' => "/orders"
    # get 'orders/index' => "/orders"
    # get 'orders/show' => "/orders/:id"
    resources :adresses, only:[:index, :create, :show, :new]
  end

  namespace :public do
    # get 'cart_items/index' => "/cart_items"
    # get 'cart_items/update' => "/cart_items/:id"
    # get 'cart_items/destroy' => "/cart_items/:id"
    get '/cart_items/destroy_all' => "cart_items#destroy_all"
    # get 'cart_items/create' => "/cart_items"
    resources :cart_items, only:[:index, :create, :update, :destroy]
  end

  namespace :public do
    get '/customers/sign_in' => "sessions#new"
    get '/customers/sign_in' => "sessions#create"
    get '/customers/sign_out' => "sessions#destroy"
  end

  namespace :public do
    # get 'customers/show' => "/customers"
    # get 'customers/edit' => "/customers/edit"
    # get 'customers/update' => "/customers"
    get '/customers/unsubscribe' => "customers#unsubscribe"
    get '/customers/withdraw' => "customers#withdraw"
    resources :customers, only:[:show, :edit, :update]
  end

  namespace :public do
    get '/customers/sign_up' => "registrations#new"
    get '/customers' => "registrations#create"
  end

  namespace :public do
    # get 'items/index' => "/items"
    # get 'items/show' => "/items/:id"
    resources :items, only:[:index, :show]
  end

 namespace :public do
    get '/' => "homes#top"
    get '/about' => "homes#about"
  end


  namespace :admin do
    patch '/admin/making_status/:id' => "making_status#update"
  end

  namespace :admin do
    # get 'orders/show'  => "/admin/orders/:id"
    # patch 'orders/update'  => "/admin/orders/:id"
    resources :orders, only:[:show, :update]
  end

  namespace :admin do
    # get 'customers/index' => "/admin#customers"
    # get 'customers/show' => "/admin/customers/:id"
    # get 'customers/edit' => "/admin/customers/:id/edit"
    # patch 'customers/update' => "/admin/customers/:id"
    resources :customers, only:[:index, :edit, :update, :show]
  end

  namespace :admin do
    # get 'genres/index' => "/admin/genres"
    # post 'genres/create'=> "/admin/genres"
    # get 'genres/edit'=> "/admin/genres/:id/edit"
    # patch 'genres/update' => "/admin/genres/:id"
    resources :genres, only:[:index, :create, :edit, :update ]
  end

  namespace :admin do
    # get 'items/index' => "/admin/items"
    # get 'items/new' => "/admin/items/new"
    # post 'items/create' => "/admin/items"
    # get 'items/show' => "/admin/items/:id"
    # get 'items/edit' => "/admin/items/:id/edit"
    # patch 'items/update' => "/admin/items/:id"
    resources :items, only:[:index, :create, :edit, :update, :show, :new]
  end

  namespace :admin do
    get '/admin' => "homes#top"
  end

  namespace :admin do
    get '/admin/sign_in' => "sessions#new"
    post '/admin/sign_in' => "sessions#create"
    delete '/admin/sign_out' => "sessions#destroy"
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
