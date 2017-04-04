Rails.application.routes.draw do
  resources :users, param: :token

  root 'users#index'

  # Link to confirm an account when created
  get '/confirm_account' => 'users#confirm_account'
  post '/login' => 'users#login'
end
