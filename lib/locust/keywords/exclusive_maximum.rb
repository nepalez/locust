module Locust::Keywords
  #
  # @private
  # @see The 'exclusiveMaximum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.3
  #
  class ExclusiveMaximum < Locust::Schema
    require_relative "exclusive_maximum/validator"

    keyword   "exclusiveMaximum"
    validator Validator
  end
end
