CityRootsWeb::Application.routes.draw do
  resources :attraction_translations

  resources :service_translations

  resources :types

  resources :event_translations , :only => :destroy

  resources :web_user_types

  get "profiles/index"
  get "mobile/index"
  get "web/index"
  get "galeria/index"
  get "pacotes/index"
  get "/payments/new", to:"payments#new", as:"new_payment"
  post "payments/payment", to:"payments#create", as:"payment_create"
  get "payments/sucess"
  get "payments/failure"

  devise_for :installs

  resources :web_users

  resources :pack_types

  resources :web_user_packs

  resources :mobile_user_cities

  resources :mobile_users

  resources :languages

  resources :cities

  resources :comment_itineraries

  resources :comment_attractions

  resources :comment_events

  resources :comment_services

  resources :rating_itineraries

  resources :rating_attractions

  resources :rating_events

  resources :rating_services

  resources :photo_attractions

  resources :photo_events

  resources :photo_services

  resources :attraction_big_types

  resources :attraction_types

  resources :service_types

  resources :event_types

  resources :itinerary_types

  resources :itinerary_attractions

  resources :itinerary_events

  resources :itinerary_services

  resources :itineraries

  resources :attractions do
    get :autocomplete_attraction_name, :on => :collection
  end

  resources :services do
    get :autocomplete_service_name, :on => :collection
  end

  resources :events do
    get :autocomplete_event_name, :on => :collection
    resource :event_translations, :only => [:new, :create,:destroy,:update]
  end

  resources :galeria

  resources :pacotes

  resources :welcome

  resources :web

  resources :mobile
  
  resources :countries

  resource :profiles

  devise_for :users
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root to:'welcome#index'

  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match 'contact' => 'contact#create', :as => 'contact_create', :via => :post
  # Example of regular route:

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
