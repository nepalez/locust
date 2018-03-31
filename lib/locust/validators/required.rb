module Locust::Validators
  #
  # Checks the 'required' keyword definition
  #
  class Required < Base
    validate :parent_is_typed
    validate :parent_describes_an_object
    validate :source_is_an_array
    validate :source_has_elements
    validate :source_elements_are_strings
    validate :source_elements_are_unique

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_an_object
      return if errors.any?
      return if parent.type.value == "object"
      errors << message("It MAY be used only for an object definition.")
    end

    def source_is_an_array
      return if errors.any?
      return if source.is_a? Array
      errors << message("Its value MUST be an array.")
    end

    def source_has_elements
      return if errors.any?
      return if source.any?
      errors << message("Its value MUST have at least one element.")
    end

    def source_elements_are_strings
      return if errors.any?
      return if source.all? { |item| item.is_a? String }
      errors << message("All its elements MUST be strings.")
    end

    def source_elements_are_unique
      return if errors.any?
      return if source.uniq.count == source.count
      errors << message("Its elements MUST be unique.")
    end
  end
end
