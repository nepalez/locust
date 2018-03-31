module Locust::Schemas
  #
  # @private
  # @see The 'multipleOf' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.1
  #
  class MultipleOf < Base
    keyword "multipleOf"
  end
end
