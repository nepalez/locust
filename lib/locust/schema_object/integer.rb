class Locust
  class SchemaObject
    #
    # Describes schema objects of the 'integer' type
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for Numeric Instances in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.2
    #
    class Integer < SchemaObject
      # rubocop: disable Metrics/LineLength
      option :multipleOf,       proc(&:to_i), optional: true, as: :multiple_of
      option :maximum,          proc(&:to_i), optional: true
      option :exclusiveMaximum, proc(&:to_i), optional: true, as: :exclusive_maximum
      option :minimum,          proc(&:to_i), optional: true
      option :exclusiveMinimum, proc(&:to_i), optional: true, as: :exclusive_minimum
      # rubocop: enable Metrics/LineLength
    end
  end
end
