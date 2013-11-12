LoPhoto::Application.routes.draw do
  devise_for :users
  
  resources :users do
    resources :user_galleries do
      resources :user_images
    end
  end

  resources :galleries do
    resources :gallery_images 
  end
  
  resources :posts do
    resources :comments
  end

  resources :inquiries, :only => [:new, :create], :path => "contact" do
    get 'thank_you', :on => :collection
  end
  
  root 'static_pages#home'

  match '/help',             to: 'static_pages#help',             via: 'get'
  match '/about',            to: 'static_pages#about',            via: 'get'
  match '/process',          to: 'static_pages#theprocess',       via: 'get'
  match '/rates_raves',      to: 'static_pages#rates',            via: 'get'
  match 'tags/:tag',         to: 'posts#index',                   via: 'get', as: :tag
  match '/toolkit',          to: 'member_pages#toolkit',          via: 'get'
  match '/style',            to: 'member_pages#style',            via: 'get'
  match '/locations',        to: 'member_pages#location',         via: 'get'
  match '/display_your_art', to: 'member_pages#display',          via: 'get'
  match '/session_specials', to: 'member_pages#session_specials', via: 'get'
  

  #http://techoctave.com/c7/posts/36-rails-3-0-rescue-from-routing-error-solution
  match '*a', to: 'errors#routing', via: 'get' 

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
