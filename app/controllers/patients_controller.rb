class PatientsController < ApplicationController
  def index
    patients = Patient.all 
    render json: patients 
  end

  def show 
    patient = Patient.find_by(id: session[:patient_id]) 
    if user
        render json: patient, status: :created 
    else
        render json: { error: "not authorized here" }, status: :unauthorized 
    end 
end

  def create 
    patient = Patient.new(patient_params)
    if patient.save 
      session[:patient_id] = patient.id 
      render json: patient 
    else
      render json: { error: "Not created"}, status: :unauthorized 
    end
  end

  def update  
    patient = Patient.update!(patient_params)
    if patient
      session[:patient_id] = patient.id 
      render json: patient 
    else
      render json: { error: "Not updated"}, status: :unauthorized 
    end
  end

  private 
  def patient_params 
    params.permit(:email, :username, :dob, :gender) 
  end
end
