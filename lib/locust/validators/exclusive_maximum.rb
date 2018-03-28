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
      errors << message unless parent.respond_to?(:options)
    end

    def parent_has_a_maximum
      return if errors.any?
      errors << message unless parent.options.key?(:maximum)
    end

    def source_is_a_boolean
      return if errors.any?
      errors << message unless [true, false].include? source
    end

    def message
      "#{super} The value of this keyword MUST be a boolean." \
      " The 'maximum' keyword MUST also be defined."
    end
  end
end
