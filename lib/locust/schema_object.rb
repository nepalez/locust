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

    option :name,   proc(&:to_s)
    option :type,   Validators::Type
    option :format, Validators::Format
    option :enum,   Validators::Enum
    option :xml,    Validators::XML
    option :const,  Validators::Const
    option :default
    option :example

    #
    # Validates an object by some path, and returns the errors
    #
    # @param [Object] object The object described by the schema
    # @param [#to_s]  path   The path to the object from root of schema
    # @return [Array<String>]
    #
    def errors(object, path)
      options.values
             .select { |option| option.is_a? Locust::Validators::Base }
             .flat_map { |validator| validator.errors(object, path) }
    end
  end
end
