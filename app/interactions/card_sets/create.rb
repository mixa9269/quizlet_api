# frozen_string_literal: true

module CardSets
  class Create < ActiveInteraction::Base
    object :current_user, class: 'User'
    string :title

    validate :check_ability_to_make_action_with_entity

    def execute
      outcome = current_user.card_sets.create(new_params)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end

    private

    def new_params
      {
        title: title
      }
    end
  end
end
