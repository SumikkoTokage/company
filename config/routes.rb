Rails.application.routes.draw do


  devise_for :creators, controllers: {
  sessions:      'creators/sessions',
  passwords:     'creators/passwords',
  registrations: 'creators/registrations'
  }
  devise_for :users, controllers:{
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'products#index'
  resources :users, :only => [:show, :edit, :update]
  get 'users/resignation' => 'users#resignation'
  get 'users/complete' => 'users#complete'
  get '/user_guide' => 'users#user_guide'

  resources :creators, :only => [:show, :index, :edit, :update]
  get 'creators/resignation' => 'creators#resignation'
  get 'creators/complete' => 'creators#complete'
  get '/creator_guide' => 'creators#creator_guide'
  get '/mypage' => 'creators#mypage'

  resources :bank_accounts, :only => [:index, :new, :create, :edit, :update, :destroy]
  resources :postages, :only => [:index, :new, :create, :edit, :update]
  resources :posts, :only => [:new, :create, :index, :edit, :update, :destroy] do
    resources :post_favorites, :only => [:index]
    post 'post_add' => 'post_favorites#create'
    delete '/post_add' => 'post_favorites#destroy'
  end
  resources :bag_items, :only => [:index]
  resources :shopping_bags, :only => [:create]
  resources :cart_items, :only => [:create, :update, :destroy]
  resources :shopping_carts, :only => [:show]
  get 'shopping_carts/pay' =>'shopping_carts#pay'
  get 'shopping_carts/purchase' =>'shopping_carts#purchase'
  get 'shopping_carts/complete' =>'shopping_carts#complete'
  get '/confirmation' => "shopping_carts#purchase"
  post  '/complete' => "shopping_carts#complete"
  resources :address_lines, :only => [:new, :create, :edit, :update, :destroy, :index]
  get 'products/complete' =>'products#complete'
  resources :products do
    resources :product_images
    post 'add' => 'product_favorites#create'
    delete '/add' => 'product_favorites#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
