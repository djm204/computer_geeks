ComputerGeeks::Application.routes.draw do

  get "store/search"
  get "store/search_results"
  devise_for :users
  #root 'index#index'

  get "/" => redirect("/index")

  get    '/index'                     , to: 'index#index'
  get    '/products'                  , to: 'products#index'            , as: 'products'
  get    '/products/:id'              , to: 'products#show'             , as: 'product'
  get    '/contact'                   , to: 'contacts#index'
  get    '/about'                     , to: 'abouts#index'
  get    '/account'                   , to: 'account#index'
  get    '/users/:id/edit'            , to: 'users#edit'                , as: 'user'
  patch  '/users/:id/edit'            , to: 'users#update'
  get    '/users/:id/change_password' , to: 'users#change_password'
  patch  '/users/:id/change_password' , to: 'users#update_password'

  get    '/search'                    , to: 'store#search'              , as: 'search'
  get    '/search_results'            , to: 'store#search_results'      , as: 'search_results'

  get    '/store/cart'                , to: 'store#cart'                , as: 'cart'
  post   '/store/cart'                , to: 'store#cart'                , as: 'add_to_cart'
  delete '/store/cart'                , to: 'store#remove_cart_item'    , as: 'remove_cart_item'
  delete '/store/cart/cart_session'   , to: 'store#delete_cart_session' , as: 'delete_cart_session'
  post   '/store/checkout'            , to: 'checkout#checkout'         , as: 'checkout'
  post   '/store/checkout/payment'    , to: 'checkout#payment'          , as: 'payment'
  
  #get   '/addresses'           , to: 'addresses#index'
  #get   '/addresses/:id/edit'  , to: 'addresses#edit'       , as: :address
  #patch '/addresses/:id/edit'  , to: 'addresses#update'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  #resources :provinces
  resources :addresses
  #resources :watcheditems
  #resources :users
  #resources :orders
  #resources :lineitems
  #resources :categories
  #resources :products
  #resources :contacts
  #resources :abouts

  get '*unmatched_route', to: redirect('/index')
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
