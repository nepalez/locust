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
      option :multipleOf,       Validators::MultipleOf, optional: true, as: :multiple_of
      option :maximum,          Validators::Maximum, optional: true
      option :exclusiveMaximum, Validators::ExclusiveMaximum, optional: true, as: :exclusive_maximum
      option :minimum,          Validators::Minimum, optional: true
      option :exclusiveMinimum, Validators::ExclusiveMinimum, optional: true, as: :exclusive_minimum
      # rubocop: enable Metrics/LineLength
    end
  end
end
