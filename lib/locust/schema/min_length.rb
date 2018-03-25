module Locust::Schema
  #
  # @private
  # @see The 'minLength' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.2
  #
  class MinLength < Locust::Struct
    keyword "minLength"
  end
end
