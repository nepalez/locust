module Locust::Keywords
  #
  # @private
  # @see The 'enum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.1.2
  #
  class Enum < Locust::Schema
    require_relative "enum/validator"
    require_relative "enum/verifier"

    keyword   "enum"
    validator Validator
    verifier  Verifier
  end
end
