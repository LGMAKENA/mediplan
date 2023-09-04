class DoctorsController < ApplicationController
  def index
    doctors = Doctor.all 
    render json: doctors 
  end

  def show 
    doctor = Doctor.find_by(id: session[:doctor_id]) 
    if doctor
        render json: doctor, status: :created 
    else
        render json: { error: "not authorized here" }, status: :unauthorized 
    end 
  end

  # def create 
  #   doctor = Doctor.new(doctor_params)
  #   if doctor.save 
  #     session[:doctor_id] = doctor.id 
  #     render json: doctor 
  #   else
  #     render json: { error: "Not created"}, status: :unauthorized 
  #   end
  # end

  private
  def doctor_params 
    params.permit(:title, :full_name, :email, :username, :dob, :gender) 
  end
end
