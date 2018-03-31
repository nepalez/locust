module Locust::Keywords
  #
  # @private
  # @see The 'format' keyword in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#dataTypeFormat
  #
  class Format < Locust::Schema
    require_relative "format/validator"

    keyword "format"
  end
end
