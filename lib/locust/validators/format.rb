class Locust
  module Validators
    #
    # @private
    # @see The 'format' keyword in OpenAPI Specification 2.0
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
