module Locust::Schemas
  #
  # @private
  # @see The 'minLength' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.2
  #
  class MinLength < Base
    keyword "minLength"
  end
end
