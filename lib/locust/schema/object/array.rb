class Locust::Schema::Object
  #
  # Describes objects of the 'array' type
  #
  # @see Schema Object in OpenAPI 2.0 specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
  #
  # @see Validation Keywords for Arrays in JSON Schema specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4
  #
  class Array < self
    option :items,       Keywords::Items, optional: true
    option :maxItems,    proc(&:to_i),    optional: true, as: :max_items
    option :minItems,    proc(&:to_i),    optional: true, as: :min_items
    option :uniqueItems, true.method(:&), optional: true, as: :unique_items
  end
end
