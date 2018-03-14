class Locust
  module Validators
    #
    # @private
    # @see The 'additionalProperties' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.6
    #
    class AdditionalProperties < Base
      private

      def initialize(value)
        super Locust::SchemaObject.call(value)
      end
    end
  end
end
