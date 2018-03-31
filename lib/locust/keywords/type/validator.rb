class Locust::Keywords::Type
  #
  # Checks the type keyword definition
  #
  class Validator < Locust::Validator
    validate :primitive

    private

    def primitive
      return if PRIMITIVES.include? source
      errors << message("The value of this keyword MUST be one of primitives:" \
                        " '#{PRIMITIVES.join("', '")}'")
    end

    PRIMITIVES = %w[null boolean integer number string array object file].freeze
  end
end
