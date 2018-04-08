module Locust::Keywords
  #
  # @private
  # @see The 'maxItems' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.4.3
  #
  class MaxItems < Locust::Schema
    require_relative "max_items/validator"
    require_relative "max_items/verifier"

    keyword   "maxItems"
    validator Validator
    verifier  Verifier
  end
end
