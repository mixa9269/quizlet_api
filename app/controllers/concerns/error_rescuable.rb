# frozen_string_literal: true

module ErrorRescuable
  extend ActiveSupport::Concern

  included do
    rescue_from Exceptions::Unauthenticated do
      render json: { error: 'Authentication is required to perform this request' }, status: :unauthorized
    end

    rescue_from Exceptions::ResourceNotFound do
      render json: { error: 'Resource not found' }, status: :not_found
    end

    rescue_from Exceptions::NotAllowed do
      render json: { error: 'Not allowed' }, status: :not_found
    end
  end
end
