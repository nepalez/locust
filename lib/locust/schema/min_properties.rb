module Locust::Schema
  #
  # @private
  # @see The 'minProperties' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.4.2
  #
  class MinProperties < Locust::Struct
    keyword "minProperties"
  end
end
