# frozen_string_literal: true

class ApplicationController < ActionController::API
  include SessionsHelper
  
  rescue_from Exceptions::Unauthenticated do
    render json: { error: 'Authentication is required to perform this request' }, status: :unauthorized
  end

  def render_single_outcome(outcome, serializer)
    if outcome.valid?
      render json: outcome.result, serializer: serializer
    else
      render json: outcome.errors, status: :bad_request
    end
  end
end
