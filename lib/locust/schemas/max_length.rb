module Locust::Schemas
  #
  # @private
  # @see The 'maxLength' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.1
  #
  class MaxLength < Base
    keyword "maxLength"
  end
end
