module Locust::Validators
  #
  # Checks the 'object' keyword definition
  #
  class Object < Base
    validate :type_present

    private

    def type_present
      errors << "#{message} The type keyword MUST be defined" unless type
    end
  end
end
