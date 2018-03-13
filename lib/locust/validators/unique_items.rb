class Locust
  module Validators
    #
    # @private
    # @see The 'minimum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
    #
    class UniqueItems < Base
      def errors(object, path)
        return [] if self == false
        return [] unless object.is_a? Array
        return [] if object.count == object.uniq.count
        ["The list #{path} contains duplicates"]
      end

      private

      def initialize(value)
        case value.to_s
        when "true"  then super(true)
        when "false" then super(false)
        else              raise_error(value)
        end
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the '#{keyword}' keyword." \
              " The value of this keyword MUST be a boolean."
      end
    end
  end
end
