module Locust::Schemas
  #
  # @private
  # @see The 'type' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.1
  #
  class Type < Base
    keyword "type"
  end
end
