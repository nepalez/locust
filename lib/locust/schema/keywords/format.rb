class Locust::Schema
  #
  # @private
  # Container for definition of the 'format' part of object schema
  #
  # @see Data Type Format in OpenAPI 2.0 specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
  #
  class Keywords::Format < SimpleDelegator
    extend Locust::Coercion

    private

    def initialize(value)
      super value.to_s
      raise_error(value) if empty?
    end

    def raise_error(value)
      raise Locust::InvalidSchemaError,
            "Invalid value #{value.inspect} for the 'format' keyword." \
            " The value of this keyword MUST be a non-empty string."
    end
  end
end
