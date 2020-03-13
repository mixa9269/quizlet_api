# frozen_string_literal: true

module Api
  module V1
    class CardSetsController < ApplicationController
      before_action :authenticate

      def create
        process_outcome(CardSets::Create.run(params)) do |result|
          render json: result, status: :created
        end
      end

      def destroy
        process_outcome(CardSets::Destroy.run(params)) do |result|
          render json: result, status: :ok
        end
      end
    end
  end
end
