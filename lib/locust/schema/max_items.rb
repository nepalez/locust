module Locust::Schema
  #
  # @private
  # @see The 'maxItems' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.2
  #
  class MaxItems < Locust::Struct
    keyword "maxItems"
  end
end
