Rails.application.routes.draw do
  namespace :public do
    get 'adresses/index' => "/adresses"
    get 'adresses/edit' => "/adresses/:id/edit"
    get 'adresses/create' => "/adresses"
    get 'adresses/update' => "/adresses/:id"
    get 'adresses/destroy' => "/adresses/:id"
  end
  namespace :public do
    get 'orders/new' => "/orders/new"
    get 'orders/confirm' => "/orders/confirm"
    get 'orders/complete' => "/orders/complete"
    get 'orders/create' => "/orders"
    get 'orders/index' => "/orders"
    get 'orders/show' => "/orders/:id"
  end
  namespace :public do
    get 'cart_items/index' => "/cart_items"
    get 'cart_items/update' => "/cart_items/:id"
    get 'cart_items/destroy' => "/cart_items/:id"
    get 'cart_items/destroy_all' => "/cart_items/destroy_all"
    get 'cart_items/create' => "/cart_items"
  end
  namespace :public do
    get 'sessions/new' => "/customers/sign_in"
    get 'sessions/create' => "/customers/sign_in"
    get 'sessions/destroy' => "/customers/sign_out"
  end
    namespace :public do
    get 'customers/show' => "/customers"
    get 'customers/edit' => "/customers/edit"
    get 'customers/update' => "/customers"
    get 'customers/unsubscribe' => "/customers/unsubscribe"
    get 'customers/withdraw' => "/customers/withdraw"
  end
  namespace :public do
    get 'registrations/new' => "/customers/sign_up"
    get 'registrations/create' => "//customers"
  end
  namespace :public do
    get 'items/index' => "/items"
    get 'items/show' => "/items/:id"
  end
  namespace :public do
    get 'homes/top' => "/"
    get 'homes/about' => "/about"
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
