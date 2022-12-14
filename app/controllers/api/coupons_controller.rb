# frozen_string_literal: true

module Api
  class CouponsController < BaseController
    def validate
      @coupon = Coupon.find_by(pin: permitted_params[:pin].upcase)

      return not_found('Промокод не найден') unless @coupon

      if @coupon.apply
        render json: { success: true, uses_left: @coupon.uses_left }, status: 200
      else
        render json: { success: false, message: @coupon.errors.messages.values.flatten }, status: 400
      end
    end

    private

    def permitted_params
      hash = Hash.new
      hash[:pin] = params.require(:pin)
      hash
    end
  end
end
