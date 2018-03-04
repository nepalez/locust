module Locust::Schema
  #
  # @private
  # Container for definition of the 'format' part of object schema
  #
  # @see OpenAPI 2.0 specification for formats
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types
  #
  class Format < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      super value.to_s
      return unless empty?
      raise ArgumentError,
            "Invalid value #{value.inspect} for the 'format' keyword." \
            " The value of this keyword MUST be a non-empty string."
    end
  end
end