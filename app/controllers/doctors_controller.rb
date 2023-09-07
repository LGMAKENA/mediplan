class DoctorsController < ApplicationController
  before_action :authorize_doctor

  def index
    render json: Doctor.all
  end

  def show
    doctor = Doctor.find_by(id: session[:doctor_id])
    render json: doctor
  end

  private

  def doctor_params
    params.permit(:title, :full_name, :email, :username, :dob, :gender)
  end

  def authorize_doctor
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :doctor_id
  end
end
