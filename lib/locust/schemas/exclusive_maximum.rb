module Locust::Schemas
  #
  # @private
  # @see The 'exclusiveMaximum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.3
  #
  class ExclusiveMaximum < Base
    keyword "exclusiveMaximum"
  end
end
