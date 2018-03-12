class Locust
  class SchemaObject
    require_relative "array"
    require_relative "boolean"
    require_relative "file"
    require_relative "integer"
    require_relative "null"
    require_relative "number"
    require_relative "object"
    require_relative "string"

    #
    # DSL for building a specific object schema by type
    #
    module Factory
      # @private
      PRIMITIVES = {
        "array"   => Array,
        "boolean" => Boolean,
        "file"    => File,
        "integer" => Integer,
        "null"    => Null,
        "number"  => Number,
        "object"  => Object,
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
        raise Locust::InvalidSchemaError,
              "Invalid value #{value.inspect} for the object schema." \
              " The value MUST have a primitive type from the following list:" \
              " '#{PRIMITIVES.keys.join("', '")}'"
      end
    end
  end
end