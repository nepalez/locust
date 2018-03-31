module Locust::Validators
  #
  # Checks the 'exclusiveMaximum' keyword definition
  #
  class ExclusiveMaximum < Base
    validate :parent_has_options
    validate :parent_has_a_maximum
    validate :source_is_a_boolean

    private

    def parent_has_options
      return if parent.respond_to?(:options)
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_has_a_maximum
      return if errors.any?
      return if parent.options.key?(:maximum)
      errors << message("The 'maximum' keyword MUST also be defined.")
    end

    def source_is_a_boolean
      return if errors.any?
      return if [true, false].include? source
      errors << message("Its value MUST be a boolean.")
    end
  end
end
