module Locust::Validators
  #
  # Checks the 'minimum' keyword definition
  #
  class Minimum < Base
    validate :parent_is_typed
    validate :parent_describes_a_numeric
    validate :source_is_a_number

    private

    def parent_is_typed
      return if parent.respond_to?(:type)
      errors << message
    end

    def parent_describes_a_numeric
      return if errors.any?
      return if %w[integer number].include? parent.type.value
      errors << message
    end

    def source_is_a_number
      return if errors.any?
      errors << message unless source.is_a? Numeric
    end

    def message
      "#{super} This keyword CAN be added to a schema describing a number." \
      " The value of this keyword MUST be a number as well."
    end
  end
end
