module Locust::Schema
  #
  # @private
  # @see The 'format' keyword in OpenAPI Specification 2.0
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
  #
  class Format < Locust::Struct
    keyword "format"
  end
end
