# frozen_string_literal: true

module Api
  module V1
    class CardSetsController < ApplicationController
      before_action :authenticate

      def create
        outcome = CardSets::Create.run(card_set_params)
        render_single_outcome(outcome, CardSetSerializer)
      end

      def destroy
        process_outcome(CardSets::Destroy.run(params)) do |result|
          render json: result, status: :ok
        end
      end

      private

      def card_set_params
        {
          title: params[:title],
          user: current_user
        }
      end
    end
  end
end
