module Locust::Keywords
  #
  # @private
  # @see The 'type' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.1.1
  #
  class Type < Locust::Schema
    require_relative "type/validator"

    keyword "type"
  end
end
