class Locust::Keywords::OneOf
  #
  # Checks the 'oneOf' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_valid_schemas

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_an_array
      return if source.is_a? Array
      errors << message("Its value MUST be an array.")
    end

    def source_has_elements
      return if errors.any?
      return if source.count.positive?
      errors << message("Its value MUST have at least one element.")
    end

    def source_elements_are_valid_schemas
      return if errors.any?
      errors.concat data.flat_map(&:validate)
    end
  end
end
