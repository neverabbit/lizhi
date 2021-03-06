Rails.application.routes.draw do
  
  get 'users/new'

  # get 'sessions/new'

  root 'static_themes#home'
  
  # get 'static_themes/home'

  get 'contact' => 'static_themes#contact'
  
  get 'business' => 'static_themes#business'
  
  get 'intro' => 'static_themes#intro'
  
  get 'recruit' => 'static_themes#recruit'
  
  get 'wechat' => 'wechats#new'
  
  get 'signup'  => 'users#new'
  
  get 'loginlz' => 'sessions#new'
  post 'loginlz' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  
  resources :users
  
  resources :companies do 
    resources :positions
  end
  # get 'positions' => 'positions#index'
  resources :positions
  post 'positions/offline'
  post 'positions/online'
  post 'positions/search'# , to: 'positions#search'
  get 'positions/results/:search_position', to: 'positions#results'
  # post 'positions/:id/offline', to: 'positions#offline', as: :offline_position
  # post 'positions/:id/online', to: 'positions#online', as: :online_position
  # resources :positions, member: { offline: :post, online: :post }
  # get 'positions/offline', to 'positions#offline', as: :offline
  # get 'positions/online'
  #
  # resources :positions, controller: :companies
  
  resources :customers
  
  
  
  get 'resume_converter' => 'resume_converters#new'
  post 'resume_converters/convert'
  
  resources :recommendations, only: [:create, :destroy, :index, :edit, :update, :show]
  
  
  get 'users/:id/admin_positions', to: 'users#admin_positions', as: :admin_positions
  
  resources :wechats

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
end
