class Locust::Schema
  #
  # @private
  # Container for definition of the 'type' part of object schema
  #
  # @see Data Types in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types
  #
  # @see JSON Schema primitive types
  #   https://tools.ietf.org/html/draft-zyp-json-schema-04#section-3.5
  #
  class Type < SimpleDelegator
    extend Coercion

    private

    PRIMITIVES = %w[null boolean integer number string object array file].freeze

    def initialize(value)
      super value.to_s
      raise_error(value) unless PRIMITIVES.include? self
    end

    def raise_error(value)
      raise DefinitionError,
            "Invalid value #{value.inspect} for the 'type' keyword." \
            " The value of this keyword MUST be stringified" \
            " to any of the following primitives: '#{PRIMITIVES.join("', '")}'."
    end
  end
end
