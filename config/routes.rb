Rails.application.routes.draw do
  # Routes for Devise Token Auth
  mount_devise_token_auth_for 'User', at: 'auth'

  # API routes #apiendpoint /api/auth/login
  namespace :api, defaults: { format: :json } do
    namespace :auth do
      post 'login', to: 'sessions#create'  # Handle login (POST request)
    end
  end
end

