module Locust::Schemas
  #
  # @private
  # @see The 'enum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.1.2
  #
  class Enum < Base
    keyword "enum"
  end
end
