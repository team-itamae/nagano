Rails.application.routes.draw do

  root to: "public/homes#top"

  get '/about' => "public/homes#about"

  post '/orders/confirm' => 'public/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

  delete '/cart_items/destroy_all' => 'public/cart_items#destroy_all'

  get '/customers' => 'public/customers#show'
  get '/customers/edit' => 'public/customers#edit'
  patch '/customers' => 'public/customers#update'
  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    get '' => 'homes#top'

    resources :orders, only: [:show, :update]
    patch 'order_details/:id' => 'order_details#update', as:'order_detail'

    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :edit, :create, :update]
    resources :items, only: [:index, :show, :create, :new, :edit, :update]


  end

  scope module: 'public' do

    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show]
    resources :cart_items, only: [:update, :create, :index, :destroy]
    resources :items, only: [:index, :show]

end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
