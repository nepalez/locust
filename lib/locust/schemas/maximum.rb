module Locust::Schemas
  #
  # @private
  # @see The 'maximum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.2
  #
  class Maximum < Base
    keyword "maximum"
  end
end
