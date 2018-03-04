module Locust::Schema
  #
  # Represents denormalized (without `$ref`) OpenAPI 2.0 object schema
  #
  # @see
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #   https://datatracker.ietf.org/doc/draft-handrews-json-schema-validation/?include_text=1
  #
  class Object
    extend Dry::Initializer
    extend Coercion

    # Keywords supported by objects of every type
    option :type,   Type,   optional: true
    option :format, Format, optional: true
    option :enum,   Enum,   optional: true
    option :const,          optional: true
    option :default,        optional: true
    option :example,        optional: true

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
