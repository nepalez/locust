module Locust::Schemas
  #
  # @private
  # @see The 'not' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.4
  #
  class Not < Base
    keyword { "not" }

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
