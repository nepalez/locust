class Locust::Keywords::Item
  #
  # Checks the 'item' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_an_array
    validate :index_is_not_negative
    validate :source_is_a_valid_schema

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

    def index_is_not_negative
      return if index && !index.negative?
      errors << message("Its index should be greater, or equal to, 0.")
    end

    def source_is_a_valid_schema
      return if errors.any?
      errors.concat schema.validate
    end
  end
end
