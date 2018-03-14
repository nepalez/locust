class Locust
  module Validators
    #
    # @private
    # @see The 'items' keyword in JSON Schema Specification (single value)
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
    #
    class Item < Base
      private

      def initialize(value)
        super Locust::SchemaObject.call(value)
      end
    end
  end
end
