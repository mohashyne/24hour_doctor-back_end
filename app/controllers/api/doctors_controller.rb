module Api
  class DoctorsController < ApplicationController
    def index
      @doctors = Doctor.all
      render json: @doctors, status: :ok
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

    def show
      @doctor = Doctor.find(params[:id])
      render json: @doctor, status: :ok
    end

    private

    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Doctor not found' }, status: :not_found
    end

    def update
      @doctor = Doctor.find(params[:id])
      if @doctor.update(doctor_params)
        render json: { message: 'Doctor updated successfully!' }, status: :ok
      else
        render json: { error: 'Doctor update failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    def destroy
      @doctor = Doctor.find(params[:id])
      if @doctor.destroy
        render json: { message: 'Doctor deleted successfully!' }, status: :ok
      else
        render json: { error: 'Doctor deletion failed. Please try again.' }, status: :unprocessable_entity
      end
    end

    private

    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    end
  end
end
