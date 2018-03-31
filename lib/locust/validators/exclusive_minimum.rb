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
      return if parent.respond_to?(:options)
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_has_a_minimum
      return if errors.any?
      return if parent.options.key?(:minimum)
      errors << message("The 'minimum' keyword MUST also be defined.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
