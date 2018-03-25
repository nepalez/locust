module Locust::Schema
  #
  # @private
  # @see The 'minimum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
  #
  class UniqueItems < Locust::Struct
    keyword "uniqueItems"
  end
end
