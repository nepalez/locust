module Locust::Schemas
  #
  # @private
  # @see The 'maxItems' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.3
  #
  class MaxItems < Base
    keyword "maxItems"
  end
end
