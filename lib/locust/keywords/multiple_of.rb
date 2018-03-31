module Locust::Keywords
  #
  # @private
  # @see The 'multipleOf' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.1
  #
  class MultipleOf < Locust::Schema
    require_relative "multiple_of/validator"

    keyword "multipleOf"
  end
end
