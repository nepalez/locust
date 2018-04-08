module Locust::Keywords
  #
  # @private
  # @see The 'maxLength' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.3.1
  #
  class MaxLength < Locust::Schema
    require_relative "max_length/validator"
    require_relative "max_length/verifier"

    keyword   "maxLength"
    validator Validator
    verifier  Verifier
  end
end
