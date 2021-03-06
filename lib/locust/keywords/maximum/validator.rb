class Locust::Keywords::Maximum
  #
  # Checks the 'maximum' keyword definition
  #
  class Validator < Locust::Validator
    validate :parent_is_an_object
    validate :parent_describes_a_numeric
    validate :source_is_a_number

    private

    def parent_is_an_object
      return if parent.is_a? Locust::Keywords::Object
      errors << message("This keyword MAY be added to an object schema only.")
    end

    def parent_describes_a_numeric
      return if errors.any?
      return if %w[integer number].include? parent.type&.source
      errors << message("It MAY be used only for a number definition.")
    end

    def source_is_a_number
      return if errors.any?
      return if source.is_a? Numeric
      errors << message("Its value MUST be a number.")
    end
  end
end
