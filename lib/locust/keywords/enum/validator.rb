class Locust::Keywords::Enum
  #
  # Checks the 'enum' keyword definition
  #
  class Validator < Locust::Validator
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_unique

    private

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
  end
end