Rails.application.routes.draw do
 
#controller :users do
 # get 'show' => 'users/show'
#end
resources :users
get 'users/edit'
controller :static_pages do
    get :home
  get 'show' =>'users/show'
end

  #get 'user_profile_page/index'
  #get 'user_profile_page/show' 
  #get 'users'  => 'users#index'

  #get 'user_profile_page/edit'

  #get 'user_profile_page/update'

  resources :posts do 
    resources :comments
  end
  scope '(:locale)' do
    resources :posts
    #resources :contacts
    #resources :about
  end
  devise_for :users

   authenticated :user do
    
      root :to => 'posts#index', as: :authenticated_root
    end

   #authenticated :user do
   #   root :to => 'posts#index', as: :authenticated_root
   #end
    #root :to => "posts#index"
  #post 'contact', to:'contact#process_form'
    #root to: 'static_pages#home'
  #end


    resources :contacts, only: [:new, :create] do
      root :to => 'static_pages#home'
    end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'static_pages#home'
   
  controller :static_pages do
    get :home
    get 'about' =>'static_pages#about'
    get 'about_class' => 'static_pages#about_class'
    get 'schedule_class' =>'static_pages#schedule_class'
  end
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
