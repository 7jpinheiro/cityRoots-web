CityRootsWeb::Application.routes.draw do
  

  resources :types
  resources :pack_types

  resources :galeria
  resources :pacotes
  resources :welcome
  resources :web
  resources :mobile
  resources :countries, :only => [:create,:destroy]
  resource :profiles
  
  resources :web_users do
    resources :web_user_types, :only => [:create,:destroy]
    resources :web_user_packs
  end

  resources :mobile_users do 
    resources :mobile_user_cities, :only => [:create,:destroy]
  end


  resources :languages, :only => [:new,:destroy]

  resources :cities, :only => [:new,:destroy]

  resource  :apis


  devise_for :installs
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy'
  end



  resources :itineraries do
    resources :rating_itineraries, :only => [:create,:destroy]
    resources :itinerary_types, :only => [:create,:destroy]
    resources :itinerary_attractions, :only => [:create,:destroy]
    resources :itinerary_events, :only => [:create,:destroy]
    resources :itinerary_services, :only => [:create,:destroy]
    resources :comment_itineraries, :only => [:create,:destroy]
    get :autocomplete_itinerary_name, :on => :collection
  end

  resources :attractions do
    resources :attraction_translations, :only => [:create,:destroy]
    resources :rating_attractions, :only => [:create,:destroy]
    resources :attraction_big_types, :only => [:create,:destroy]
    resources :attraction_types, :only => [:create,:destroy]
    resources :comment_attractions, :only => [:create,:destroy]
    resources :photo_attractions, :only => [:create,:destroy]
    get :autocomplete_attraction_name, :on => :collection
  end

  resources :services do
    resources :service_translations, :only => [:create,:destroy]
    resources :rating_services, :only => [:create,:destroy]
    resources :service_types, :only => [:create,:destroy]
    resources :comment_services, :only => [:create,:destroy]
    resources :photo_services, :only => [:create,:destroy]
    get :autocomplete_service_name, :on => :collection
  end

  resources :events do
    resources :event_translations , :only => [:create,:destroy]
    resources :rating_events, :only => [:create,:destroy]
    resources :event_types, :only => [:create,:destroy]
    resources :comment_events, :only => [:create,:destroy]
    resources :photo_events, :only => [:create,:destroy]
    get :autocomplete_event_name, :on => :collection
  end

  
  get "profiles/index"
  get "mobile/index"
  get "web/index"
  post "attractions/excel"
  post "events/excel"
  post "services/excel"
  get "galeria/index"
  get "pacotes/index"
  get "/payments/new", to:"payments#new", as:"new_payment"
  post "payments/payment", to:"payments#create", as:"payment_create"
  get "payments/sucess"
  get "payments/failure"

  get "attractions/:id/gallery",  to:"attractions#gallery", as:"attractions_gallery"
  get "events/:id/gallery",  to:"events#gallery", as:"events_gallery"
  get "services/:id/gallery",  to:"services#gallery", as:"services_gallery"


  get "admin_users",  to:"admin_users#index", as:"admin_users_index"
  get "admin_users/:id/activar",  to:"admin_users#activar", as:"admin_users_activar"
  get "admin_users/:id",to:"admin_users#show", as:"admin_users_show"
  get "admin_users/:id/edit",to:"admin_users#edit", as:"admin_users_edit"
  put "admin_users/:id",to:"admin_users#update", as:"admin_users_update"
  delete "admin_users/:id",to:"admin_users#destroy", as:"admin_users_destroy"

devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  
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
