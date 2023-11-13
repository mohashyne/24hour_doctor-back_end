module Api
  class ReservationsController < ApplicationController
    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        render json: { message: 'Reservation successful!' }, status: :created
      else
        render json: { error: 'Reservation failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    def index
      if params[:user_id].present?
        reservations = Reservation.where(user_id: params[:user_id])
        render json: reservations, status: :ok
      else
        render json: { error: 'User ID parameter is missing.' }, status: :unprocessable_entity
      end
    end

    def all_reservations
      reservations = Reservation.all
      render json: reservations, status: :ok
    end

    def update
      @reservation = Reservation.find(params[:id])

      if @reservation.update(reservation_params)
        render json: { message: 'Reservation updated successfully!' }, status: :ok
      else
        render json: { error: 'Reservation update failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    def destroy
      @reservation = Reservation.find(params[:id])

      if @reservation.destroy
        render json: { message: 'Reservation deleted successfully!' }, status: :ok
      else
        render json: { error: 'Reservation deletion failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    def show
      @reservation = Reservation.find(params[:id])
      render json: @reservation, status: :ok
    end

    private

    def reservation_params
      params.require(:reservation).permit(:date, :city, :user_id, :doctor_id)
    end
  end
end
