module Locust::Schema
  #
  # @private
  # @see The 'minItems' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.3
  #
  class MinItems < Locust::Struct
    keyword "minItems"
  end
end
