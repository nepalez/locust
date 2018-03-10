class Locust::Schema::Object
  #
  # Describes objects of the 'object' type
  #
  # @see Schema Object in OpenAPI 2.0 specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schema-object
  #
  # @see Validation Keywords for Objects in JSON Schema specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5
  #
  class Struct < self
    # rubocop: disable Metrics/LineLength
    option :required,             Keywords::Required,     default: -> { [] }
    option :properties,           Keywords::Properties,   optional: true
    option :additionalProperties, Keywords::Properties,   optional: true, as: :additional_properties
    option :maxProperties,        proc(&:to_i),           optional: true, as: :max_properties
    option :minProperties,        proc(&:to_i),           optional: true, as: :min_properties
    # rubocop: enable Metrics/LineLength
  end
end
