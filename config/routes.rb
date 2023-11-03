Rails.application.routes.draw do
  # Routes for Devise Token Auth
  mount_devise_token_auth_for "User", at: "auth"

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :auth do
      post "login", to: "sessions#create"
    end

    #API endpoint for retrieving all doctors already implemented
    resources :doctors
    resources :reservations, only: %i[create show]
  end
end
