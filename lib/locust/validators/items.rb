class Locust
  module Validators
    #
    # @private
    # @see The 'items' keyword in JSON Schema Specification (several values)
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
    #
    class Items < Base
      private

      def initialize(parent, value)
        value = value.map { |item| SchemaObject.call(item, parent) }
        super parent, value
      end
    end
  end
end
