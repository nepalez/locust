class Locust::Keywords::Object
  #
  # Checks the 'object' keyword definition
  #
  class Validator < Locust::Validator
    validate :type_is_defined
    validate :options_are_valid

    private

    def type_is_defined
      return if any_of || one_of || type
      errors << message("The type keyword MUST be defined")
    end

    def options_are_valid
      children = options.values
                        .select { |item| item.respond_to?(:validate) }
                        .flat_map(&:validate)
      errors.concat children
    end
  end
end
