# frozen_string_literal: true

module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    user_id = session[:user_id]
    @current_user ||= User.find_by(id: user_id) if user_id
  end

  def signed_in?
    current_user.present?
  end

  def authenticate
    signed_in? || (raise ::Exceptions::Unauthenticated)
    params[:current_user] = current_user
  end
end
