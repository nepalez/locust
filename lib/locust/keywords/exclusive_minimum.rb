module Locust::Keywords
  #
  # @private
  # @see The 'exclusiveMinimum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.5
  #
  class ExclusiveMinimum < Locust::Schema
    require_relative "exclusive_minimum/validator"

    keyword "exclusiveMinimum"
  end
end
