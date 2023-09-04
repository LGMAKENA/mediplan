class SessionsController < ApplicationController
    def create 
        patient = Patient.find_by(username: params[:username])
        if user&.authenticate(params[:password])
            session[:patient_id] = patient.id 
            render json: patient 
        
        else
            errors = []
            if patient.nil?
                errors << 'invalid password'
            else
                errors << 'invalid username'
            end
            render json: { errors: errors }, status: :unauthorized 
        end
    end

    def destroy      
       if logged_in?
        session.delete :patient_id
        head :no_content 
       else
        errors = ['Not logged in']
        render json: { errors: errors }, status: :unauthorized
       end
    end 
end
