class PatientsController < ApplicationController
  #before_action :require_login
  # skip_before_action :authorize, only: [:create, :show]

  def index
    patients = Patient.all
    render json: patients
  end

  def show
    # render json: @current_user

    patient = Patient.find_by(id: params[:id])
    render json: patient, status: :ok
    # # if patient
    # #     render json: patient, status: :created
    # # else
    # #     render json: { error: "not authorized here" }, status: :unauthorized
    # # end
  end

  def create
    patient = Patient.new(patient_params)
    if patient.save
      session[:patient_id] = patient.id
      render json: patient, status: :created
    else
      render json: { error: "Not created" }, status: :unauthorized
    end
  end

  def update
    patient = Patient.find_by(id: params[:patient_id])

    if patient.update!(patient_params)
      session[:patient_id] = patient.id
      render json: patient
    else
      render json: { error: "Not updated" }, status: :unauthorized
    end
  end

  def destroy
    patient = Patient.find_by(id: params[:patient_id])
    patient.delete
    head :no_content
  end

  private

  def patient_params
    params.permit(:email, :username, :password, :dob, :gender)
  end
end
