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
      default_image_url = "https://cdn.vectorstock.com/i/preview-2x/12/29/icon-of-medical-doctor-with-shadow-in-modern-flat-vector-3351229.webp"
      
      if params[:doctor][:image].present?
        selected_image = params[:doctor][:image] 
    
        @doctor = Doctor.new(doctor_params.merge(image: selected_image, image_url: default_image_url))
      elsif params[:doctor][:image_url].present?
      
        image_url = params[:doctor][:image_url]
        @doctor = Doctor.new(doctor_params.merge(image_url: image_url))
      else
    
       @doctor = Doctor.new(doctor_params.merge(image_url: default_image_url))
      end
    
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
      params.require(:doctor).permit(:name, :specialty, :image_url, :image)
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Doctor not found' }, status: :not_found
    end
  end
end
