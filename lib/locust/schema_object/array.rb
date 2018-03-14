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
      option :maxItems,    Validators::MaxItems
      option :minItems,    Validators::MinItems
      option :uniqueItems, Validators::UniqueItems
      option :items,       Validators::Items
      option :item,        Validators::Item

      private

      def initialize(value = {})
        value = symbolize_keys(value)

        case items = value.delete(:items)
        when ::Hash
          value[:item] = items.merge(parent: self)
        when ::Array
          value[:items] = items.map { |item| item.merge(parent: self) }
        end

        super value
      end
    end
  end
end
