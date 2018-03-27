module Locust::Schemas
  #
  # @private
  # @see The 'format' keyword in OpenAPI Specification 2.0
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
  #
  class Format < Base
    keyword "format"
  end
end
