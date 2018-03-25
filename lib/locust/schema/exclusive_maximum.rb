module Locust::Schema
  #
  # @private
  # @see The 'exclusiveMaximum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
  #
  class ExclusiveMaximum < Locust::Struct
    keyword "exclusiveMaximum"
  end
end
