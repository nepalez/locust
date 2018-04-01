class Locust::Keywords::Default
  #
  # Checks the 'default' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end
  end
end
