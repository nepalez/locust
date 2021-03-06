class Locust::Keywords::MaxProperties
  #
  # Checks the 'maxProperties' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_object
    validate :source_is_an_integer
    validate :source_is_not_negative

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_an_object
      return if errors.any?
      return if parent.type.source == "object"
      errors << message("It MAY be used only for an object definition.")
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
