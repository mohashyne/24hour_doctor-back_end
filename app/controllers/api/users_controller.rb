class Api::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: 'User registered successfully!' }, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def search_by_email
    email = params[:email]
    @user = User.find_by(email:)
    if @user
      user_info = {
        id: @user.id,
        username: @user.name,
        email: @user.email
      }
      render json: { user: user_info }, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
