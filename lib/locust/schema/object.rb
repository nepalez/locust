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
    option :type,   proc(&:to_s),     optional: true
    option :format, Keywords::Format, optional: true
    option :enum,   Keywords::Enum,   optional: true
    option :xml,    Keywords::XML,    default: -> {}
    option :const,                    optional: true
    option :default,                  optional: true
    option :example,                  optional: true
    # refers back to the parent object in the schema and property name
    option :parent,                   optional: true
    option :name,   proc(&:to_s),     optional: true

    class << self
      require_relative "object/array"
      require_relative "object/boolean"
      require_relative "object/file"
      require_relative "object/integer"
      require_relative "object/null"
      require_relative "object/number"
      require_relative "object/string"
      require_relative "object/struct"

      # @private
      PRIMITIVES = {
        "array"   => Array,
        "boolean" => Boolean,
        "file"    => File,
        "integer" => Integer,
        "null"    => Null,
        "number"  => Number,
        "object"  => Struct,
        "string"  => String,
      }.freeze

      #
      # Factory method to construct object of proper type
      #
      # @param  [Hash<#to_s, Object>] options The definition of the schema
      # @return [Locust::Schema::Object]
      #
      def call(options)
        options = symbolize_keys(options)
        type    = options[:type].to_s.downcase
        klass   = PRIMITIVES.fetch(type) { raise_error(options) }
        klass.new(options)
      end

      private

      def raise_error(value)
        raise DefinitionError,
              "Invalid value #{value.inspect} for the object schema." \
              " The value MUST have a primitive type from the following list:" \
              " '#{PRIMITIVES.keys.join("', '")}'"
      end
    end
  end
end
