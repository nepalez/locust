class Locust
  module Validators
    #
    # @private
    # Container for definition of the 'items' part of object schema
    #
    # @see Items in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
    #
    class Items < Base
      private

      def initialize(value)
        value = value.map { |item| Locust::SchemaObject.call(item) }
        super value
      end
    end
  end
end
