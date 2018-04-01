class Locust::Keywords::MinLength
  #
  # Checks the 'minLength' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_a_string
    validate :source_is_an_integer
    validate :source_is_not_negative

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

    def source_is_an_integer
      return if errors.any?
      return if source.is_a? Integer
      errors << message("Its value MUST be an integer.")
    end

    def source_is_not_negative
      return if errors.any?
      return unless source.negative?
      errors << message("Its value MUST be greater than, or equal to, 0.")
    end
  end
end
