module Locust::Keywords
  #
  # @private
  # @see The 'maximum' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.2.2
  #
  class Maximum < Locust::Schema
    require_relative "maximum/validator"
    require_relative "maximum/verifier"

    keyword   "maximum"
    validator Validator
    verifier  Verifier
  end
end
