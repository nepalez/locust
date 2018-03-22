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
  class SchemaObject < Struct
    require_relative "schema_object/factory"
    extend Factory

    option :name,   proc(&:to_s)
    option :type,   Keywords::Type
    option :format, Keywords::Format
    option :enum,   Keywords::Enum
    option :xml,    Keywords::XML
    option :const,  Keywords::Const
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
      validators.flat_map { |validator| validator.errors(object, path) }
    end

    private

    def validators
      @validators ||= options.each_with_object([]) do |(key, val), obj|
        next if key == :parent
        next unless val.respond_to?(:errors)
        next unless val.method(:errors).arity == 2
        obj << val
      end
    end
  end
end
