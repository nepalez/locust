module Locust::Keywords
  #
  # @private
  # @see The 'minItems' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.4
  #
  class MinItems < Locust::Schema
    require_relative "min_items/validator"

    keyword   "minItems"
    validator Validator
  end
end
