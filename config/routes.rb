Rails.application.routes.draw do

  namespace :admin do
    patch 'making_status/:id' => 'making_status#update'
    get '' => 'homes#top'

    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :show, :create, :new, :edit, :update]
  end


    get '/adresses' => 'public/adresses#index'
    get '/adresses/:id/edit' => 'public/adresses#edit'
    post '/adresses' => 'public/adresses#create'
    patch '/adresses/:id' => 'public/adresses#update'
    delete '/adresses/:id' => 'public/adresses#destroy'

    get '/orders/new' => 'public/orders#new'
    post '/orders/confirm' => 'public/orders#confirm'
    get '/orders/complete' => 'public/orders#complete'
    post '/orders' => 'public/orders#create'
    get '/orders' => 'public/orders#index'
    get '/orders/:id' => 'public/orders#show'

    get '/cart_items' => 'public/cart_items#index'
    patch '/cart_items/:id' => 'public/cart_items#update'
    delete '/cart_items/:id' => 'public/cart_items#destroy'
    delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'
    post '/cart_items' => 'public/cart_items#create'


    get '/customers' => 'public/customers#show'
    get '/customers/edit' => 'public/customers#edit'
    patch '/customers' => 'public/customers#update'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw'

    get '/items' => 'public/items#index'
    get '/items/:id' => 'public/items#show'

  root to: "public/homes#top"
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
