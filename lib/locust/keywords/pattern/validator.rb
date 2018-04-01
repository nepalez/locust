class Locust::Keywords::Pattern
  #
  # Checks the 'pattern' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_a_string
    validate :source_is_a_string

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_a_string
      return if errors.any?
      return if parent.type.source == "string"
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
