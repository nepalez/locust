class Locust
  module Validators
    #
    # @private
    # @see The 'required' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.3
    #
    class Required < Base
      private

      def initialize(value)
        value = stringify_items(value)
        super value.reject(&:empty?).uniq
        raise_error(value) unless value == self
      end

      def stringify_items(value)
        value.map(&:to_s)
      rescue
        raise_error(value)
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'required' keyword." \
              " The value of this keyword MUST be an array." \
              " Elements of this array, if any, MUST be non-empty strings," \
              " and MUST be unique."
      end
    end
  end
end
