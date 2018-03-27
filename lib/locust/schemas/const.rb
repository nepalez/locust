module Locust::Schemas
  #
  # @private
  # @see The 'const' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
  #
  class Const < Base
    keyword "const"
  end
end
