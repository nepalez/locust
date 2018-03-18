class Locust
  module Validators
    #
    # @private
    # @see The 'additionalProperties' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.6
    #
    class AdditionalProperties < Base
      def errors(object, path)
        return [] unless object.is_a? Hash

        object.reject { |key| properties.include? key.to_s }
              .flat_map { |key, item| __getobj__.errors item, "#{path}/#{key}" }
      end

      private

      def initialize(parent, value)
        super parent, SchemaObject.call(value, parent)
      end

      def properties
        @properties ||= Array parent.properties&.keys
      end
    end
  end
end
