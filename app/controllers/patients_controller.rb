class PatientsController < ApplicationController
  def index
    patients = Patient.all 
    render json: patients 
  end

  def create 
    patient = Patient.new(patient_params)
    if patient.save 
      render json: patient 
    else
      render json: { error: "Not created"}, status: :unauthorized 
    end
  end

  private
  def patient_params 
    params.permit(:email, :username, :dob, :gender) 
  end
end
