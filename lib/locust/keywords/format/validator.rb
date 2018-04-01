class Locust::Keywords::Format
  #
  # Checks the type keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :source_is_a_string
    validate :source_is_not_empty

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def source_is_a_string
      return if source.is_a?(String)
      errors << message("Its value MUST be a string.")
    end

    def source_is_not_empty
      return if errors.any?
      return unless source == ""
      errors << message("Its value MUST not be empty.")
    end
  end
end
