module Locust::Schemas
  #
  # @private
  # @see The 'minItems' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.3
  #
  class MinItems < Base
    keyword "minItems"
  end
end
