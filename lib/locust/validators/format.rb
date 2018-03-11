class Locust
  module Validators
    #
    # @private
    # Container for definition of the 'format' part of object schema
    #
    # @see Data Type Format in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
    #
    class Format < Base
      private

      def initialize(value)
        super value.to_s
        raise_error(value) if empty?
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'format' keyword." \
              " The value of this keyword MUST be a non-empty string."
      end
    end
  end
end
