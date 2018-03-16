class Locust
  module Validators
    #
    # @private
    # @see The 'properties' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.4
    #
    class Properties < Base
      private

      def initialize(parent, value = {})
        data = hashify(value).each_with_object({}) do |(key, item), obj|
          obj[key] = SchemaObject.call(item, parent)
        end

        super parent, data
      end

      def hashify(value)
        Hash(value).each_with_object({}) { |(k, v), obj| obj[k.to_s] = v }
      rescue
        raise_error(value)
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'properties' keyword." \
              " The value of this keyword MUST be an object." \
              " Each value of this object MUST be a valid Object Schema."
      end
    end
  end
end
