Rails.application.routes.draw do
  
  namespace :admin do
    get 'making_status/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'items/index'
    get 'items/new'
    get 'items/create'
    get 'items/show'
    get 'items/edit'
    get 'items/update'
  end
  
  resources :adresses, only:[:index, :create, :edit, :update, :destroy]
  
  resources :adresses, only:[:index, :create, :show, :new]
  get 'orders/confirm'
  get 'orders/complete'

  resources :cart_items, only:[:index, :create, :update, :destroy]
  get 'cart_items/destroy_all'
  
  resources :customers, only:[:show, :edit, :update]
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
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
