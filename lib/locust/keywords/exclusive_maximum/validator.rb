class Locust::Keywords::ExclusiveMaximum
  #
  # Checks the 'exclusiveMaximum' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_a_number
    validate :parent_has_a_maximum
    validate :source_is_a_boolean

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("It MAY be added to an object schema only.")
    end

    def parent_describes_a_number
      return if errors.any?
      return if %w[integer number].include? parent.type.source
      errors << message("It MAY be used only for definition of a number.")
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
