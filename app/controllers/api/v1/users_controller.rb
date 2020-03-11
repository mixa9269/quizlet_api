# frozen_string_literal: true

module Api
  module V1
    class UsersController < ApplicationController
      before_action :authenticate, only: %w[current]

      def create
        outcome = Users::Create.run(user_params)
        log_in(outcome.result) if outcome.valid?
        render_single_outcome(outcome, UserSerializer)
      end

      def current
        render json: current_user, serializer: UserSerializer
      end

      private

      def user_params
        {
          email: params[:email],
          username: params[:username],
          password: params[:password],
          password_confirmation: params[:password_confirmation]
        }
      end
    end
  end
end
