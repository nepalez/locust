class Locust
  module Validators
    #
    # @private
    # @see The 'namespace' keyword in  the 'xml' part of object schema
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
    #
    class XML::Namespace < Base
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
