class Locust::Keywords::Property
  #
  # Checks the 'property' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_object
    validate :key_is_present
    validate :source_is_a_valid_schema_object

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

    def key_is_present
      return if errors.any?
      return unless key.to_s == ""
      errors << message("Its name MUST not be empty.")
    end

    def source_is_a_valid_schema_object
      return if errors.any?
      errors.concat schema.validate
    end
  end
end
