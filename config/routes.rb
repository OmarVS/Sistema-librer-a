Rails.application.routes.draw do
  get 'reports/stock'

  get 'stock', to: "stock#index"

  get 'errors/not_found'

  get 'errors/internal_server_error'

  resources :sales
  get 'reports/purchases'
  get 'reports/sales'
  get 'reports/earnings'
  get 'reports/purchases'
  get 'reports/sales'
  get 'reports/earnings'

  get 'static_pages/home'
  get 'payments/create'
  get "/checkout", to: "payments#checkout"
  get "/carrito", to: "shopping_carts#show"
  get '/add/:product_barcode', as: :add_to_cart, to: 'in_shopping_carts#create'
  get "/ok", to: "static_pages#payment_succed"

  resources :users, :purchases, :tickets, :sales, :genres, :providers, :books, :products
  resources :in_shopping_carts, only: [:create,:destroy,:show]
  resources :shopping_carts, only: [:create,:destroy,:show]

  post "/pagar", to: "payments#create"

  resources :sessions, only: [:new, :create, :destroy]
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

end
