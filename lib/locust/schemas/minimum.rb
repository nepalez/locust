module Locust::Schemas
  #
  # @private
  # @see The 'minimum' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
  #
  class Minimum < Base
    keyword "minimum"
  end
end
