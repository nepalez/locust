module Locust::Schemas
  #
  # @private
  # @see The 'multipleOf' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.1
  #
  class MultipleOf < Base
    keyword "multipleOf"
  end
end
