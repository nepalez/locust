class Locust::Keywords::Nullable
  #
  # Checks the 'nullable' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_a_boolean

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
