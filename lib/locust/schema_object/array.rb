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
      # rubocop: disable Metrics/LineLength
      option :maxItems,    Validators::MaxItems,    optional: true, as: :max_items
      option :minItems,    Validators::MinItems,    optional: true, as: :min_items
      option :uniqueItems, Validators::UniqueItems, optional: true, as: :unique_items
      option :items,       Validators::Items,       optional: true
      option :item,        Validators::Item,        optional: true
      # rubocop: enable Metrics/LineLength

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
