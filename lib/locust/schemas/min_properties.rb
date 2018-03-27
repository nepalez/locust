module Locust::Schemas
  #
  # @private
  # @see The 'minProperties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.4.2
  #
  class MinProperties < Base
    keyword "minProperties"
  end
end
