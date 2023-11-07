class Api::Auth::SessionsController < ActionController::API
  #skip_before_action :verify_authenticity_token # Only for API
 

  def create
    user_params = params.dig(:user)
    email = user_params[:email]
    password = user_params[:password]

    user = User.find_by(email: email)

    if user && user.valid_password?(password)
      sign_in(user) # This is a Devise method that signs in the user
      render json: { message: 'Login successful', user: user }, status: :ok
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end
end
