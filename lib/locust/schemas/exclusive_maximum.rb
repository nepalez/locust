module Locust::Schemas
  #
  # @private
  # @see The 'exclusiveMaximum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
  #
  class ExclusiveMaximum < Base
    keyword "exclusiveMaximum"
  end
end
