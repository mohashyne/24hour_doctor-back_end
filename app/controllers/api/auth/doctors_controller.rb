module Api
  class DoctorsController < ApplicationController
    def index
      @doctors = Doctor.all
    end

    def new
      @doctor = Doctor.new
    end

    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        render json: { message: 'Doctor created successfully!' }, status: :created
      else
        render json: { error: 'Doctor creation failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    private

    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    end
  end
end
