class PatientsController < ApplicationController
  before_action :authorize_patient, only: [:index]
  skip_before_action :authorize_patient, only: [:create]

  def index
    render json: Patient.all
  end

  def show
    # patient = find_patient
    patient = Patient.find_by(id: session[:patient_id])
    render json: patient, status: :ok
  end

  def create
    patient = Patient.create!(patient_params)

    session[:patient_id] = patient.id
    render json: patient, status: :created
  end

  def update
    patient = find_patient
    patient.update!(patient_params)
    session[:patient_id] = patient.id
    render json: patient
  end

  def destroy
    patient.delete
    head :no_content
  end

  private

  def find_patient
    Patient.find(params[:id])
  end

  def patient_params
    params.permit(:email, :username, :password, :dob, :gender, :full_name)
  end

  def authorize_patient
    return render json: { error: "Not authorized" }, status: :unauthorized unless session.include? :patient_id
  end
end
