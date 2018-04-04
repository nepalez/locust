class Locust::Keywords::AdditionalProperties
  #
  # Checks the 'additionalProperties' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_object
    validate :schema_is_valid

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

    def schema_is_valid
      return if errors.any?
      errors.concat Array(schema&.validate)
    end
  end
end
