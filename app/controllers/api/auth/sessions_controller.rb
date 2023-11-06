class Api::Auth::SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
    
        if user && user.valid_password?(params[:password])
          sign_in(user) # This is a Devise method that signs in the user
          render json: { message: 'Login successful', user: user }, status: :ok
        else
          render json: { error: 'Invalid email or password' }, status: :unauthorized
        end
      end
end
