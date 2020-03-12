# frozen_string_literal: true

module CardSets
  class Create < ActiveInteraction::Base
    string :title
    object :user

    def execute
      outcome = user.card_sets.create(inputs)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end
  end
end
