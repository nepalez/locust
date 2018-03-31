class Locust::Keywords::UniqueItems
  #
  # Checks the 'uniqueItems' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_typed
    validate :parent_describes_an_array
    validate :source_is_a_boolean

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_an_array
      return if errors.any?
      return if parent.type.value == "array"
      errors << message("It MAY be used only for an array definition.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
