module Locust::Schema
  #
  # @private
  # @see The 'const' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
  #
  class Const < Locust::Struct
    keyword "const"
  end
end
