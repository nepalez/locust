module Locust::Schemas
  #
  # @private
  # @see The 'maxProperties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.4.1
  #
  class MaxProperties < Base
    keyword "maxProperties"
  end
end
