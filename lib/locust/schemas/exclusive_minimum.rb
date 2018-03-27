module Locust::Schemas
  #
  # @private
  # @see The 'exclusiveMinimum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
  #
  class ExclusiveMinimum < Base
    keyword "exclusiveMinimum"
  end
end
