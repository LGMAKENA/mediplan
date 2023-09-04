class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all 
    render json: doctors 
  end

  def create
    doctor = Doctor.new(doctor_params)
    if doctor.save 
      render json: doctor 
    else
      render json: { error: "Not created"}, status: :unauthorized 
    end
  end

  private
  def doctor_params 
    params.permit(:title, :full_name, :email, :username, :dob, :gender) 
  end
end
