class Locust
  module Keywords
    #
    # @private
    # @see The 'items' keyword in JSON Schema Specification (several values)
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
    #
    class Items < Base
      def errors(object, path)
        return [] unless object.is_a? Array

        object.zip(to_a).flat_map.with_index do |(item, validator), index|
          item_path = "#{path}/#{index}"
          Array validator&.errors(item, item_path)
        end
      end

      private

      def initialize(parent, value)
        value = value.map { |item| SchemaObject.call(item, parent) }
        super parent, value
      end
    end
  end
end
