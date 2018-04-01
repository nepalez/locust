class Locust::Keywords::Items
  #
  # Checks the 'items' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_array

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
  end
end
