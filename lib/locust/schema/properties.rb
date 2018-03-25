module Locust::Schema
  #
  # @private
  # @see The 'properties' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.4
  #
  class Properties < Locust::Struct
    keyword "properties"

    def list
      @list ||= \
        if source.is_a? Hash
          source.map { |k, v| Property.call({ key: k, source: v }, parent) }
        else
          []
        end
    end
  end
end
