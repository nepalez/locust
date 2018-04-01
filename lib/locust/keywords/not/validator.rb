class Locust::Keywords::Not
  #
  # Checks the 'not' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :schema_is_valid

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def schema_is_valid
      return if errors.any?
      errors.concat schema.validate
    end
  end
end
