class Locust
  #
  # Container for OpenAPI 2.0 sub-schema object
  #
  # @see
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#schemaObject
  #   https://datatracker.ietf.org/doc/draft-handrews-json-schema-validation/?include_text=1
  #
  class Schema
    extend Dry::Initializer
    extend Coercion = Locust::Coercion

    #
    # The hash of known options assigned to the instance
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class.dry_initializer.attributes(self)
    end

    private

    def initialize(value)
      data = Hash(value).each_with_object({}) { |(k, v), o| o[k.to_sym] = v }
      super(data)
    rescue
      raise ArgumentError,
            "Invalid value #{value.inspect} for the schema." \
            " The value MUST be a hash."
    end

    require_relative "schema/type"
    require_relative "schema/format"
    require_relative "schema/pattern"
    require_relative "schema/enum"
    require_relative "schema/xml"
    require_relative "schema/required"
    require_relative "schema/items"
    require_relative "schema/object"
  end
end
