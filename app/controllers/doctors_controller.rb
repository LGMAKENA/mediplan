class DoctorsController < ApplicationController
  # before_action :require_login 

  def index
    doctors = Doctor.all 
    render json: doctors 
  end

  def show 
    doctor = Doctor.find_by(id: session[:doctor_id]) 
    if doctor
        render json: doctor 
    else
        render json: { error: "not authorized here" }, status: :unauthorized 
    end 
  end


  private
  def doctor_params 
    params.permit(:title, :full_name, :email, :username, :dob, :gender) 
  end
end
