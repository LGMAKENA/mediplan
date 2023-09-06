class DoctorSessionsController < ApplicationController

    def create 
        doctor = Doctor.find_by(username: params[:username])
        if doctor&.authenticate(params[:password])
            session[:doctor_id] = doctor.id 
            render json: doctor    
        
        else
            errors = ["Invalid username or password"]
            # if user.nil?
            #     errors << 'invalid password'
            # else 
            #     errors << 'invalid username'
            # end
            render json: { errors: errors }, status: :unauthorized 
        end 
    end

    def destroy      
       if logged_in?
        session.delete :doctor_id
        head :no_content 
       else
        errors = ['Not logged in']
        render json: { errors: errors }, status: :unauthorized
       end
    end 
end
