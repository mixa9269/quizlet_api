# frozen_string_literal: true

module CardSets
  class Update < CardSets::Base
    string :title

    validate :check_ability_to_make_action_with_entity

    def execute
      entity.title = title if title?

      errors.merge!(entity.errors) unless entity.save

      entity
    end
  end
end
