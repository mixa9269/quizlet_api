# frozen_string_literal: true

module CardSets
  class Base < ActiveInteraction::Base
    string :id
    object :current_user, class: 'User'

    validate :entity_presence
    validate :check_ability_to_make_action_with_entity

    private

    def entity
      @entity ||= CardSet.find_by(id: id)
    end

    def entity_presence
      entity || raise(Exceptions::ResourceNotFound)
    end

    def check_ability_to_make_action_with_entity
      entity.user_id == current_user.id || raise(::Exceptions::NotAllowed)
    end
  end
end
