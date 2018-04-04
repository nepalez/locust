class Locust::Keywords::Items
  #
  # Checks the 'items' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_array
    validate :source_schema_is_valid
    validate :source_schemas_are_valid

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_an_array
      return if errors.any?
      return if parent.type.source == "array"
      errors << message("It MAY be used only for an array definition.")
    end

    def source_schema_is_valid
      return if errors.any?
      errors.concat Array(schema&.validate)
    end

    def source_schemas_are_valid
      return if errors.any?
      schemas.map { |schema| errors.concat schema.validate }
    end
  end
end
