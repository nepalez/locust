module Locust::Validators
  #
  # Checks the 'maxLength' keyword definition
  #
  class MaxLength < Base
    validate :parent_is_typed
    validate :parent_describes_a_string
    validate :source_is_an_integer
    validate :source_is_not_negative

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_a_string
      return if errors.any?
      errors << message unless parent.type.value == "string"
    end

    def source_is_an_integer
      return if errors.any?
      errors << message unless source.is_a? Integer
    end

    def source_is_not_negative
      return if errors.any?
      errors << message if source.negative?
    end

    def message
      "#{super} This keyword CAN be added to a schema describing a 'string'." \
      " The value of this keyword MUST be an integer." \
      " This integer MUST be greater than, or equal to, 0."
    end
  end
end
