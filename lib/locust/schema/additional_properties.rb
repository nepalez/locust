module Locust::Schema
  #
  # @private
  # @see The 'additionalProperties' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.6
  #
  class AdditionalProperties < Locust::Struct
    keyword "additionalProperties"

    def schema
      @schema ||= Object[source, self]
    end
  end
end
