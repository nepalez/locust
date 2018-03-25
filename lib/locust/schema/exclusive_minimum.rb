module Locust::Schema
  #
  # @private
  # @see The 'exclusiveMinimum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
  #
  class ExclusiveMinimum < Locust::Struct
    keyword "exclusiveMinimum"
  end
end
