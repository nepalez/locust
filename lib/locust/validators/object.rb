module Locust::Validators
  #
  # Checks the 'object' keyword definition
  #
  class Object < Base
    validate :type_present

    private

    def type_present
      return if type
      errors << message("The type keyword MUST be defined")
    end
  end
end
