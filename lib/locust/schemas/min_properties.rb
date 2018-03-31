module Locust::Schemas
  #
  # @private
  # @see The 'minProperties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.2
  #
  class MinProperties < Base
    keyword "minProperties"
  end
end
