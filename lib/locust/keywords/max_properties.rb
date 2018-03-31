module Locust::Keywords
  #
  # @private
  # @see The 'maxProperties' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.1
  #
  class MaxProperties < Locust::Schema
    require_relative "max_properties/validator"

    keyword "maxProperties"
  end
end
