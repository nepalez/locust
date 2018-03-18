class Locust
  module Keywords
    #
    # @private
    # @see The 'items' keyword in JSON Schema Specification (single value)
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
    #
    class Item < Base
      def errors(object, path)
        return [] unless object.is_a? Array

        object.flat_map.with_index do |item, index|
          item_path = "#{path}/#{index}"
          __getobj__.errors(item, item_path)
        end
      end

      private

      def initialize(parent, value)
        super parent, SchemaObject.call(value, parent)
      end
    end
  end
end
