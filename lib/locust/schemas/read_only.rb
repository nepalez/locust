module Locust::Schemas
  #
  # @private
  # @see The 'readOnly' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-10.3
  #
  class ReadOnly < Base
    keyword "readOnly"
  end
end
