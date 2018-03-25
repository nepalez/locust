module Locust::Schema
  #
  # @private
  # @see The 'maximum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
  #
  class Maximum < Locust::Struct
    keyword "maximum"
  end
end
