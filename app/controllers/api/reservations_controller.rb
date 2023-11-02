module Api
  class ReservationsController < ApplicationController
    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
        send_reservation_notification(@reservation)
        ReservationMailer.confirmation_email(@reservation).deliver_later
        render json: { message: 'Reservation successful!' }, status: :created
      else
        render json: { error: 'Reservation failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    private

    def reservation_params
      params.require(:reservation).permit(:date, :city, :user_id, :doctor_id)
    end

    def send_reservation_notification(reservation)
      NotificationService.notify_user(reservation.user, 'Reservation successful')
    end
  end
end
