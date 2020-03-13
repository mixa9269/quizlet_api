# frozen_string_literal: true

class ApplicationController < ActionController::API
  include SessionsHelper
  include ErrorRescuable

  def render_single_outcome(outcome, serializer)
    if outcome.valid?
      render json: outcome.result, serializer: serializer
    else
      render json: outcome.errors, status: :bad_request
    end
  end

  def process_outcome(outcome)
    if outcome.invalid?
      render json: outcome.errors, status: :bad_request if outcome.invalid?
    elsif block_given?
      yield outcome.result
    end
  end
end
