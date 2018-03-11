class Locust
  class SchemaObject
    #
    # Describes objects of the numeric types 'integer' and 'number'
    #
    # @see Schema Object in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
    #
    # @see Validation Keywords for Numeric Instances in JSON Schema specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.2
    #
    class Number < SchemaObject
      # rubocop: disable Metrics/LineLength
      option :multipleOf,       proc(&:to_f), optional: true, as: :multiple_of
      option :maximum,          proc(&:to_f), optional: true
      option :exclusiveMaximum, proc(&:to_f), optional: true, as: :exclusive_maximum
      option :minimum,          proc(&:to_f), optional: true
      option :exclusiveMinimum, proc(&:to_f), optional: true, as: :exclusive_minimum
      # coerce type-agnostic properties
      option :const,   optional: true, type: proc(&:to_f)
      option :default, optional: true, type: proc(&:to_f)
      option :example, optional: true, type: proc(&:to_f)
      option :enum,    optional: true, type: ->(v) { Validators::Enum.call Array(v).map(&:to_f) }
      # rubocop: enable Metrics/LineLength
    end
  end
end
