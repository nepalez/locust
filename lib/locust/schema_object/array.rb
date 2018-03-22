class Locust
  class SchemaObject
    #
    # Describes objects of the 'array' type
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for Arrays in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4
    #
    class Array < SchemaObject
      option :maxItems,    Keywords::MaxItems
      option :minItems,    Keywords::MinItems
      option :uniqueItems, Keywords::UniqueItems
      option :items,       Keywords::Items
      option :item,        Keywords::Item

      private

      def initialize(parent, items: nil, **value)
        case items
        when ::Hash  then value[:item]  = items
        when ::Array then value[:items] = items
        end

        super parent, value
      end
    end
  end
end
