module Locust::Validators
  #
  # Checks the 'pattern' keyword definition
  #
  class Pattern < Base
    validate :parent_is_typed
    validate :parent_describes_a_string
    validate :source_is_a_string

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_a_string
      return if errors.any?
      return if parent.type.value == "string"
      errors << message("It MAY be used only for a string definition.")
    end

    def source_is_a_string
      return if errors.any?
      return if source.is_a? String
      errors << message("Its value MUST be a string." \
                       " This string SHOULD be a valid regular expression," \
                       " according to the ECMA 262 regular expression dialect.")
    end
  end
end
