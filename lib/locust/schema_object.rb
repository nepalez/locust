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

    option :type,   Validators::Type,   optional: true
    option :format, Validators::Format, optional: true
    option :enum,   Validators::Enum,   optional: true
    option :xml,    Validators::XML,    default: -> {}
    option :const,                      optional: true
    option :default,                    optional: true
    option :example,                    optional: true
    # refers back to the parent object in the schema and property name
    option :parent,                     optional: true
    option :name,   proc(&:to_s),       optional: true
  end
end
