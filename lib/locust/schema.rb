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
    extend Locust::Coercion

    require_relative "schema/keywords"
    require_relative "schema/object"

    #
    # The hash of known options assigned to the instance
    #
    # @return [Hash<Symbol, Object>]
    #
    def options
      @options ||= self.class.dry_initializer.attributes(self)
    end

    private

    def symbolize_keys(value)
      self.class.send(:symbolize_keys, value)
    end
  end
end
