module Locust::Schemas
  #
  # @private
  # @see The 'minLength' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.3.2
  #
  class MinLength < Base
    keyword "minLength"
  end
end
