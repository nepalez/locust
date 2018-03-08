module Locust::Schema
  #
  # Represents dereferenced (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see Schema Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #
  # @see Validation Keywords for Any Instance Type in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1
  #
  class Object
    extend Dry::Initializer
    extend Coercion

    option :type,     Type,            optional: true
    option :format,   Format,          optional: true
    option :enum,     Enum,            optional: true
    option :readOnly, true.method(:&), default: -> { false }, as: :read_only
    option :const,                     optional: true
    option :default,                   optional: true
    option :example,                   optional: true

    #
    # The hash of known options assigned to the schema with symbolized keys
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class.dry_initializer.attributes(self)
    end

    private

    def initialize(value)
      super symbolize_keys(value)
      return if type
      raise ArgumentError,
            "Invalid value #{value.inspect} for the object schema." \
            " The value MUST have a proper type."
    end

    def symbolize_keys(value)
      Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
    rescue
      raise ArgumentError,
            "Invalid value #{value.inspect} for the object schema." \
            " The value MUST be a hash describing some object."
    end
  end
end
