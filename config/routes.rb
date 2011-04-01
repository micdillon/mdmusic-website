Mdmusic::Application.routes.draw do

	match 'contact_frontend' => 'contacts#frontend'
	match 'afp_frontend' => 'afp#frontend'
	match 'discog_frontend' => 'discog#frontend'
	match '/afp/video/:id' => 'afp#video'
  match 'admin' => 'admin#index'

  namespace :admin do
    resources :contacts
    resources :video_groups do
		  resources :videos
	  end
    resources :projects do
      resources :releases do
        resources :tracks
        resources :buylinks
      end
    end
  end

  get "admin/index"
  get "buylinks/index"
  get "tracks/index"
  get "releases/index"
  get "project/index"
  get "project/new"
  get "project/edit"
  get "project/show"
  get "discog/frontend"

  get "home/index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
