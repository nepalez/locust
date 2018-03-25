module Locust::Schema
  #
  # @private
  # @see The 'maxLength' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.1
  #
  class MaxLength < Locust::Struct
    keyword "maxLength"
  end
end
