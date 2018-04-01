class Locust::Keywords::Xml
  #
  # Checks the 'xml' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :options_are_valid

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def options_are_valid
      return if errors.any?
      errors.concat options.values.flat_map(&:validate)
    end
  end
end
