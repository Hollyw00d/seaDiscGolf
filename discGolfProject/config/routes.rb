Rails.application.routes.draw do

  # USERS ROUTES
  get 'users' => 'users#index'

  post 'users' => 'users#create'

  get 'users/new' => 'users#new'

  get 'users/login' => 'users#login'
  # shows user login page

  post 'users/login' => 'users#userLogin'
  # logs in a user

  post 'users/logout' => 'users#logout'
  # logs out a user

  get 'users/:id' => 'users#show'
  # shows a single users profile page

  get 'users/edit/:id' => 'users#edit'

  patch 'users/edit/:id' => 'users#update'

  delete 'users/:id' => 'users#delete'





  # COURSES ROUTES
  get '/' => 'courses#index'
  # shows all courses

  get 'courses/new' => 'courses#new'
  # shows page to add courses

  get 'courses/:id' => 'courses#show'
  # shows a single courses page/profile

  post 'courses/new' => 'courses#create'
  # creates a new course

  get 'courses/edit' => 'course#edit'

  patch 'courses/edit' => 'course#update'

  delete 'courses/delete' => 'courses#delete'





  # COMMENTS ROUTES
  post 'comments' => 'comments#create'

  get 'comments/edit/:id' => 'comments#edit'

  patch 'comments/edit/:id' => 'comments#update'

  delete 'comments/:id' => 'comments#delete'





  

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
