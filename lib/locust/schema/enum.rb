module Locust::Schema
  #
  # @private
  # @see The 'enum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.2
  #
  class Enum < Locust::Struct
    keyword "enum"
  end
end
