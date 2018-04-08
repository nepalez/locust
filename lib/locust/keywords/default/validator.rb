class Locust::Keywords::Default
  #
  # Checks the 'default' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_valid

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_valid
      return if errors.any?
      errors.concat parent.verify(source, *full_path)
    end
  end
end
