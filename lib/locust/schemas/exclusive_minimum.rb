module Locust::Schemas
  #
  # @private
  # @see The 'exclusiveMinimum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.5
  #
  class ExclusiveMinimum < Base
    keyword "exclusiveMinimum"
  end
end
