module Locust::Validators
  #
  # Checks the 'exclusiveMinimum' keyword definition
  #
  class ExclusiveMinimum < Base
    validate :parent_has_options
    validate :parent_has_a_minimum
    validate :source_is_a_boolean

    private

    def parent_has_options
      errors << message unless parent.respond_to?(:options)
    end

    def parent_has_a_minimum
      return if errors.any?
      errors << message unless parent.options.key?(:minimum)
    end

    def source_is_a_boolean
      return if errors.any?
      errors << message unless [true, false].include? source
    end

    def message
      "#{super} The value of this keyword MUST be a boolean." \
      " The 'minimum' keyword MUST also be defined."
    end
  end
end
