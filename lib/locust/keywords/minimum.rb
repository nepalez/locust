module Locust::Keywords
  #
  # @private
  # @see The 'minimum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.4
  #
  class Minimum < Locust::Schema
    require_relative "minimum/validator"

    keyword "minimum"
  end
end
