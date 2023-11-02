class DoctorsController < ApplicationController
    
    
    def index
        # TODO: modify the fetch Doctors frontend interaction, if needed
      @doctors = Doctor.all
    end
  
    def new
      @doctor = Doctor.new
    end
  
    def create
      @doctor = Doctor.new(doctor_params)
      if @doctor.save
        redirect_to doctors_path
      else
        render 'new'
      end
    end
  
  
    private
  
    def doctor_params
      params.require(:doctor).permit(:name, :specialty)
    end
  end
  