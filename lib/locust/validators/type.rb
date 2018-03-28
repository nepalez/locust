module Locust::Validators
  #
  # Checks the type keyword definition
  #
  class Type < Base
    validate :primitive

    private

    def primitive
      return if PRIMITIVES.include? source
      errors << "#{message} The value of this keyword MUST be a string" \
                " equal to one of primitives: '#{PRIMITIVES.join("', '")}'"
    end

    PRIMITIVES = %w[null boolean integer number string array object file].freeze
  end
end
