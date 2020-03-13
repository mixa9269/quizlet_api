# frozen_string_literal: true

module CardSets
  class Destroy < CardSets::Base
    validate :check_ability_to_make_action_with_entity

    def execute
      entity.destroy
    end
  end
end
