class ReservationsController < ApplicationController
    def create
      @reservation = Reservation.new(reservation_params)
      if @reservation.save
      else
        puts "try again or create a rule to redirect to the form agin"
      end
    end
  
    private
  
    def reservation_params
      params.require(:reservation).permit(:date, :city, :user_id, :doctor_id)
    end
  end
  
