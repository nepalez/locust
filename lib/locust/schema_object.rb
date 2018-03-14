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

    option :parent
    option :name,   proc(&:to_s)
    option :type,   Validators::Type
    option :format, Validators::Format
    option :enum,   Validators::Enum
    option :xml,    Validators::XML, default: -> {}
    option :const,  Validators::Const
    option :default
    option :example
  end
end
