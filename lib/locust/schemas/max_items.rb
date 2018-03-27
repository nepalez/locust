module Locust::Schemas
  #
  # @private
  # @see The 'maxItems' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.2
  #
  class MaxItems < Base
    keyword "maxItems"
  end
end
