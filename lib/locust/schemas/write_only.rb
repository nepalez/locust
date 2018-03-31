module Locust::Schemas
  #
  # @private
  # @see The 'writeOnly' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-10.3
  #
  class WriteOnly < Base
    keyword "writeOnly"
  end
end
