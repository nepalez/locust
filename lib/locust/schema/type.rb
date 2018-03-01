module Locust::Schema
  #
  # @private
  # Container for definition of the 'type' part of object schema
  #
  # @see JSON Schema formats
  #   https://tools.ietf.org/html/draft-zyp-json-schema-04#section-3.5
  #
  # @see OpenAPI 2.0 format for 'file'
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types
  #
  class Type < SimpleDelegator
    extend Coercion

    private

    PRIMITIVES = %w[null boolean integer number string object array file].freeze

    def initialize(value)
      super value.to_s
      return if PRIMITIVES.include? self
      raise ArgumentError,
            "Invalid value #{value.inspect} for the 'type' keyword." \
            " The value of this keyword MUST be stringified" \
            " to any of the following primitives: '#{PRIMITIVES.join("', '")}'."
    end
  end
end
