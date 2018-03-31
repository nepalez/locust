module Locust::Schemas
  #
  # @private
  # @see The 'minItems' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.4
  #
  class MinItems < Base
    keyword "minItems"
  end
end
