Rails.application.routes.draw do
  # mount Rswag::Ui::Engine => '/api-docs'
  # mount Rswag::Api::Engine => '/api-docs'

  # Routes for Devise Token Auth
  mount_devise_token_auth_for "User", at: "auth"

  # API routes
  namespace :api, defaults: { format: :json } do
    namespace :auth do
      post "login", to: "sessions#create"
    end

    #API endpoint for deleting a doctor already implemented
    resources :doctors
    resources :reservations, only: %i[create show]
    #use Registration Endpoint
    resources :users, only: [:create, :show]
  end

end
