module Locust::Schema
  #
  # @private
  # @see The 'maxProperties' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.4.1
  #
  class MaxProperties < Locust::Struct
    keyword "maxProperties"
  end
end
