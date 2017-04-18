Rails.application.routes.draw do
  resources :users, param: :token

  root 'users#index'

  # Link to confirm an account when created
  get '/confirm_account' => 'users#confirm_account'
  post '/login' => 'users#login'

  resources :promotions, only: [:index, :show, :create, :update]
  put 'promotion/get_down/:id', to: 'promotions#get_down'

  post 'promotion/:id/add_branch', to: 'promotions#add_branch_to_a_promotion'
  delete 'promotion/:id/remove_branch', to: 'promotions#remove_branch_from_a_promotion'
  post 'promotion/:id/add_product', to: 'promotions#add_product_to_a_promotion'
  delete 'promotion/:id/remove_product', to: 'promotions#remove_product_from_a_promotion'
  post '/promotion/:id/add_service', to: 'promotions#add_service_to_a_promotion'
  delete '/promotion/:id/remove_service', to: 'promotions#remove_service_from_a_promotion'
  #post 'promotions/:id/add_all_products', to: 'product_promotion_relations#add_all_products_to_a_promotion'

  #delete '/promotions/:id/remove_all_products', to: 'product_promotion_relations#remove_all_products_from_a_promotion'


  #post '/promotions/:id/add_all_services', to: 'promotion_service_relations#add_all_services_to_a_promotion'

  #delete '/promotions/:id/remove_all_services', to: 'promotion_service_relations#remove_all_services_from_a_promotion'

  resources :products, only: [:index, :create, :update]
  put 'products/get_down/:id', to: 'products#get_down'

  resources :branches, only: [:index, :create, :update]
  post '/branch/:id/add_product', to: 'branches#add_product_to_a_branch'
  post '/branch/:id/add_service', to: 'branches#add_service_to_a_branch'
  delete '/branch/:id/remove_product', to: 'branches#remove_product_from_a_branch'
  delete '/branch/:id/remove_service', to: 'branches#remove_service_from_a_branch'
  put 'branch/get_down/:id', to: 'branches#get_down'

  resources :services, only: [:index, :create, :update]
  put 'services/get_down/:id', to: 'services#get_down'

  resources :company_types, only: [:index, :create, :update]

  resources :companies, only: [:index, :create, :update]
  put 'companies/get_down/:id', to: 'companies#get_down'

  resources :categories, only: [:index, :show, :create, :update]

  resources :branch_types, only: [:index, :create, :update]

  post 'company_user_relations', to: 'company_user_relations#follow'
  post 'company_user_relations', to: 'company_user_relations#add_admin_user'
  delete 'company_user_relations', to: 'company_user_relations#stop_follow'
  delete 'company_user_relations', to: 'company_user_relations#remove_admin_user'

end
