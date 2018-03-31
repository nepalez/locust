module Locust::Keywords
  #
  # @private
  # @see The 'minLength' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.3.2
  #
  class MinLength < Locust::Schema
    require_relative "min_length/validator"

    keyword "minLength"
  end
end
