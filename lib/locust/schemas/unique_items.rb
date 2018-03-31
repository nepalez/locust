module Locust::Schemas
  #
  # @private
  # @see The 'minimum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.5
  #
  class UniqueItems < Base
    keyword "uniqueItems"
  end
end
