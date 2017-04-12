Rails.application.routes.draw do
  resources :users, param: :token

  root 'users#index'

  # Link to confirm an account when created
  get '/confirm_account' => 'users#confirm_account'
  post '/login' => 'users#login'

  resources :users, only: [:index, :create, :update]

  resources :promotions, only: [:index, :create, :update]

  post 'promotion/add_branch', to: 'promotions#add_branch_to_a_promotion'
  delete 'promotion/remove_branch', to: 'promotions#remove_branch_from_a_promotion'

  post 'promotion/add_product', to: 'promotions#add_product_to_a_promotion'
  #post 'promotions/:id/add_all_products', to: 'product_promotion_relations#add_all_products_to_a_promotion'
  delete 'promotion/remove_product', to: 'promotions#remove_product_from_a_promotion'
  #delete '/promotions/:id/remove_all_products', to: 'product_promotion_relations#remove_all_products_from_a_promotion'

  post '/promotion/add_service', to: 'promotions#add_service_to_a_promotion'
  #post '/promotions/:id/add_all_services', to: 'promotion_service_relations#add_all_services_to_a_promotion'
  delete '/promotion/remove_service', to: 'promotions#remove_service_from_a_promotion'
  #delete '/promotions/:id/remove_all_services', to: 'promotion_service_relations#remove_all_services_from_a_promotion'

  resources :products, only: [:index, :create, :update]

  resources :branches, only: [:index, :create, :update]
  post '/branch/add_product', to: 'branches#add_product_to_a_branch'
  post '/branch/add_service', to: 'branches#add_service_to_a_branch'
  delete '/branch/remove_product', to: 'branches#remove_product_from_a_branch'
  delete '/branch/remove_service', to: 'branches#remove_service_from_a_branch'

  resources :services, only: [:index, :create, :update]

  resources :company_types, only: [:index, :create, :update]

  resources :companies, only: [:index, :create, :update]

  resources :categories, only: [:index, :create, :update]

  resources :branch_types, only: [:index, :create, :update]

  post 'company_user_relations', to: 'company_user_relations#add_relation_user_company'
  put 'company_user_relations', to: 'company_user_relations#update_relation_user_company'
  delete 'company_user_relations', to: 'company_user_relations#destroy_relation_user_company'
  
end
