module Locust::Schemas
  #
  # @private
  # @see The 'maximum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
  #
  class Maximum < Base
    keyword "maximum"
  end
end
