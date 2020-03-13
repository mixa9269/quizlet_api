# frozen_string_literal: true

module CardSets
  class Destroy < CardSets::Base
    def execute
      entity.destroy
    end
  end
end
