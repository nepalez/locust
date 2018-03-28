module Locust::Validators
  #
  # Checks the 'multipleOf' keyword definition
  #
  class MultipleOf < Base
    validate :parent_is_typed
    validate :parent_describes_a_numeric
    validate :source_is_a_number
    validate :source_is_positive

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

    def source_is_positive
      return if errors.any?
      errors << message unless source.to_f.positive?
    end

    def message
      "#{super} This keyword CAN be added to a schema describing a number." \
      " The value of this keyword MUST be a number." \
      " This number MUST be strictly greater than 0."
    end
  end
end
