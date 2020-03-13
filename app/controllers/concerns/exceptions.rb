# frozen_string_literal: true

module Exceptions
  class Unauthenticated < StandardError; end
  class ResourceNotFound < StandardError; end
  class NotAllowed < StandardError; end
end
