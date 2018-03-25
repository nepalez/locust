module Locust::Schema
  #
  # @private
  # @see The 'multipleOf' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.1
  #
  class MultipleOf < Locust::Struct
    keyword "multipleOf"
  end
end
