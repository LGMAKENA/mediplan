# class ApplicationController < ActionController::API
#   include ActionController::Cookies

#   private

#   def current_user
#     @current_user ||= Patient.find_by(id: session[:patient_id])
#   end

#   def require_login
#     unless logged_in?
#       errors = ["Not logged in"]
#       render json: { errors: errors }, status: :unauthorized
#     end
#   end

#   def logged_in?
#     #    !session[:user_id].nil?
#     session.include? :patient_id
#   end
# end

class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # before_action :authorize

  def authorize
    # @current_user = Patient.find_by(id: session[:patient_id])
    render json: { errors: ["Not Authorized"] }, status: :unauthorized unless session.include? :patient_id
  end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
  end

  def render_not_found_response
    render json: { error: "Bird not found" }, status: :not_found
  end
end
