class Locust::Keywords::Properties
  #
  # Checks the 'properties' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_object
    validate :source_has_schemas
    validate :source_schemas_are_valid

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

    def source_has_schemas
      return if errors.any?
      return if schemas.any?
      errors << message("It must be an object whose values are valid schemas.")
    end

    def source_schemas_are_valid
      return if errors.any?
      schemas.each_value { |schema| errors.concat schema.validate }
    end
  end
end
