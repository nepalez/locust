class Locust
  class SchemaObject
    #
    # Describes objects of the numeric types 'integer' and 'number'
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for numerics in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.2
    #
    class Numeric < SchemaObject
      option :exclusiveMaximum, Keywords::ExclusiveMaximum
      option :exclusiveMinimum, Keywords::ExclusiveMinimum
      option :maximum,          Keywords::Maximum
      option :minimum,          Keywords::Minimum
      option :multipleOf,       Keywords::MultipleOf
    end
  end
end
