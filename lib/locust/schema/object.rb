class Locust::Schema
  #
  # Represents dereferenced (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see Schema Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #
  # @see Validation Keywords for Any Instance Type in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1
  #
  class Object < self
    option :type,     Type,            optional: true
    option :format,   Format,          optional: true
    option :enum,     Enum,            optional: true
    option :xml,      XML,             default: -> { nil }
    option :readOnly, true.method(:&), default: -> { false }, as: :read_only
    option :const,                     optional: true
    option :default,                   optional: true
    option :example,                   optional: true

    private

    def initialize(value)
      super
      return if type
      raise DefinitionError,
            "Invalid value #{value.inspect} for the object schema." \
            " The value MUST have a proper type."
    end
  end
end
