class Locust
  #
  # Represents dereferenced (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see Schema Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #
  # @see Validation Keywords for Any Instance Type in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1
  #
  class SchemaObject < Schema
    require_relative "schema_object/factory"
    extend Factory

    option :parent,                      optional: true
    option :name,    proc(&:to_s),       optional: true
    option :type,    Validators::Type,   optional: true
    option :format,  Validators::Format, optional: true
    option :enum,    Validators::Enum,   optional: true
    option :xml,     Validators::XML,    default: -> {}
    option :const,   Validators::Const,  optional: true
    option :default,                     optional: true
    option :example,                     optional: true
  end
end
