Rails.application.routes.draw do
  namespace :public do
    get 'adresses/index'
    get 'adresses/edit'
    get 'adresses/create'
    get 'adresses/update'
    get 'adresses/destroy'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/confirm'
    get 'orders/complete'
    get 'orders/create'
    get 'orders/index'
    get 'orders/show'
  end
  namespace :public do
    get 'cart_items/index'
    get 'cart_items/update'
    get 'cart_items/destroy'
    get 'cart_items/destroy_all'
    get 'cart_items/create'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
    namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
    get 'registrations/destroy'
  end
  namespace :public do
    get 'items/index'
    get 'items/show'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  namespace :admin do
    patch 'making_status/update' => "/admin/making_status/:id"
  end
  namespace :admin do
    get 'orders/show'  => "/admin/orders/:id"
    patch 'orders/update'  => "/admin/orders/:id"
  end
  namespace :admin do
    get 'customers/index' => "/admin/customers"
    get 'customers/show' => "/admin/customers/:id"
    get 'customers/edit' => "/admin/customers/:id/edit"
    patch 'customers/update' => "/admin/customers/:id"
  end
  namespace :admin do
    get 'genres/index' => "/admin/genres"
    post 'genres/create'=> "/admin/genres"
    get 'genres/edit'=> "/admin/genres/:id/edit"
    patch 'genres/update' => "/admin/genres/:id"
  end
  namespace :admin do
    get 'items/index' => "/admin/items"
    get 'items/new' => "/admin/items/new"
    post 'items/create' => "/admin/items"
    get 'items/show' => "/admin/items/:id"
    get 'items/edit' => "/admin/items/:id/edit"
    patch 'items/update' => "/admin/items/:id"
  end
  namespace :admin do
    get 'homes/top' => "/admin"
  end
  namespace :admin do
    get 'sessions/new' => "/admin/sign_in"
    post 'sessions/create' => "/admin/sign_in"
    delete 'sessions/destroy' => "/admin/sign_out"
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
