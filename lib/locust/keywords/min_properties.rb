module Locust::Keywords
  #
  # @private
  # @see The 'minProperties' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.2
  #
  class MinProperties < Locust::Schema
    require_relative "min_properties/validator"

    keyword   "minProperties"
    validator Validator
  end
end
