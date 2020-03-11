# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(email: params['email']).try(:authenticate, params['password'])

        if user
          log_in(user)
          render json: user, serializer: UserSerializer
        else
          render json: { status: 401 }
        end
      end

      def logout
        @current_user = nil
        session.destroy
        render json: { success: true }
      end
    end
  end
end
