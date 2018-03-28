module Locust::Schemas
  #
  # @private
  # @see The 'additionalProperties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.6
  #
  class AdditionalProperties < Base
    keyword "additionalProperties"

    def schema
      @schema ||= Object[source, self] unless [true, false].include? source
    end

    def allowed?
      !!source
    end
  end
end
