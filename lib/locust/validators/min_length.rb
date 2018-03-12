class Locust
  module Validators
    #
    # @private
    # @see The 'min_length' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.2
    #
    class MinLength < Base
      def errors(object, path)
        return [] unless object.respond_to? :length
        return [] if object.length >= self
        ["The length of value '#{object}' of object #{path}" \
         " is less than #{self}"]
      end

      private

      def initialize(value)
        super(value.to_i)
        raise_error(value) if negative?
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'min_length' keyword." \
              " The value of this keyword MUST be a non-negative integer."
      end
    end
  end
end
