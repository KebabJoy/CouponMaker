# frozen_string_literal: true

module Api
  class BaseController < ApplicationController
    before_action :authorize_request!
    skip_before_action :verify_authenticity_token

    rescue_from ActionController::ParameterMissing, with: :handle_parameter_missing

    def authorize_request!
      if request.headers['Authorization'] != '06e3184abdfc6951f821876d61b7fa47'
        forbidden('Authorization header must contain valid token!')
      end
    end

    def forbidden(message = 'Unauthorized')
      render json: { success: false, message: message }, status: 403
    end

    def handle_parameter_missing(exception)
      render json: { error: true, message: exception.message.capitalize }, status: 400
    end

    def not_found(message = "Not Found")
      render json: { success: false, message: message }, status: :not_found
    end
  end
end
