module Locust::Schemas
  #
  # @private
  # @see The 'maxProperties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.1
  #
  class MaxProperties < Base
    keyword "maxProperties"
  end
end
