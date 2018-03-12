class Locust
  module Validators
    #
    # @private
    # @see The 'enum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.2
    #
    class Enum < Base
      def errors(object, path)
        return [] if include? object
        ["The #{object} of object #{path} doesn't match #{self}"]
      end

      private

      def initialize(value)
        super uniq_array(value)
        raise_error(value) unless self == value && any?
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'enum' keyword." \
              " The value of this keyword MUST be an array." \
              " This array SHOULD have at least one element." \
              " Elements in the array SHOULD be unique."
      end

      def uniq_array(value)
        value.uniq
      rescue
        raise_error(value)
      end
    end
  end
end
