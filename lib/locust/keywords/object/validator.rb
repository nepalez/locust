class Locust::Keywords::Object
  #
  # Checks the 'object' keyword definition
  #
  class Validator < Locust::Validator
    validate :type_present

    private

    def type_present
      return if type
      errors << message("The type keyword MUST be defined")
    end
  end
end
