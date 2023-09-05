class ApplicationController < ActionController::API
    include ActionController::Cookies

    private
  
    def require_login
      unless logged_in?
      errors = ['Not logged in']
      render json: { errors: errors }, status: :unauthorized
      end
  end
  
  def logged_in?
  #    !session[:user_id].nil?
     session.include? :patient_id
  end
end
