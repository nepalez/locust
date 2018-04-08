class Locust::Keywords::Enum
  #
  # Checks the 'enum' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_unique
    validate :source_elements_are_valid

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
      return if source.any?
      errors << message("Its value MUST have at least one element.")
    end

    def source_elements_are_unique
      return if errors.any?
      return if source.uniq.count == source.count
      errors << message("Its elements MUST be unique.")
    end

    def source_elements_are_valid
      return if errors.any?
      list = source.flat_map { |item| parent.verify(item, *full_path) }
      errors.concat(list)
    end
  end
end
