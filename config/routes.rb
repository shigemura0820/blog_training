Blogapp::Application.routes.draw do

 devise_for :users, :controllers => {
  :omniauth_callbacks => 'users/omniauth_callbacks',
  :sessions => "users/sessions",
  :registrations => "users/registrations",
  :passwords => "users/passwords"
}
resources :users, :only => [:index, :show, :destroy] do 
  collection do
    get 'all_users'
    get 'admin'
    delete 'delete_all_users'
    delete 'delete_all_articles' 
  end
  member do
    delete 'user_delete'
    delete 'delete_all_users'
    delete 'delete_all_articles'
  end

  resources :follows, only: [:index,:create] do
    collection do 
      get 'follower'
    end
  end

  resources :favorites, only: [:index]
end
resources :favorites, only: [:destroy] 
resources :follows, only: [:destroy]
resources :articles do 
  resources :comments
  resources :favorites, only: [:create] 
end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'users#index'

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
