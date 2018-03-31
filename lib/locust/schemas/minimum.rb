module Locust::Schemas
  #
  # @private
  # @see The 'minimum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.4
  #
  class Minimum < Base
    keyword "minimum"
  end
end
