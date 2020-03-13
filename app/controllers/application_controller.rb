# frozen_string_literal: true

class ApplicationController < ActionController::API
  include SessionsHelper
  include ErrorRescuable

  def process_outcome(outcome)
    if outcome.invalid?
      render json: outcome.errors, status: :bad_request
    elsif block_given?
      yield outcome.result
    end
  end
end
