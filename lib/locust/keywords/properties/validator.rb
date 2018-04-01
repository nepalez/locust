class Locust::Keywords::Properties
  #
  # Checks the 'properties' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_object

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
  end
end
