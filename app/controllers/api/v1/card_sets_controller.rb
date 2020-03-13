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

      def update
        process_outcome(CardSets::Update.run(params)) do |result|
          render json: result, status: :ok
        end
      end

      def show
        process_outcome(CardSets::Show.run(params)) do |result|
          render json: result, status: :ok
        end
      end

      def index
        result = CardSet
        result = result.where('lower(title) LIKE :search', search: "%#{params[:search]}%") if params[:search]
        result = result.where(user_id: params[:author_id]) if params[:author_id]
        result = result.page(params[:page]).per(params[:per])

        render json: result,
               each_serializer: CardSetSerializer,
               meta: { total_pages: result.total_pages,
                       total_count: result.total_count }, adapter: :json
      end
    end
  end
end
