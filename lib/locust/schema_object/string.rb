class Locust
  class SchemaObject
    #
    # Describes objects of the 'string' type
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for Strings in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.3
    #
    class String < SchemaObject
      option :maxLength, Keywords::MaxLength
      option :minLength, Keywords::MinLength
      option :pattern,   Keywords::Pattern
    end
  end
end
