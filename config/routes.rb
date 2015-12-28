Rails.application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  # Created when running 'bin/rails generate controller welcome index'
  get 'welcome/index'

  
  # Resource: used for a collection of similar objects. CRUD operations are performed on them 
  # (read, update, destroy, etc.)
  
  # We can declare standard REST resources
  # Rails defines routes for all the standard RESTful actions
  resources :articles do
    resources :comments
  end
  
  # :xxx --> is a Symbol get :xxx -> will map directly to an action (get 'profile', to: :show)
  # Passing a String to 'get' will expect a controller#action format
  
  # You can have the root of your site routed with "root"
  # Connect the root of your site with a specific controller and action
  root 'welcome#index2'



  # ======================================
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
