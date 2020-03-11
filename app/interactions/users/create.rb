# frozen_string_literal: true

module Users
  class Create < ActiveInteraction::Base
    string :email, :username, :password, :password_confirmation

    def execute
      outcome = User.new(inputs)

      errors.merge!(outcome.errors) unless outcome.save

      outcome
    end
  end
end
