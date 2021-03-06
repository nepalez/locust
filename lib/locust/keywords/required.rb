module Locust::Keywords
  #
  # @private
  # @see The 'required' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.3
  #
  class Required < Locust::Schema
    require_relative "required/validator"
    require_relative "required/verifier"

    keyword   "required"
    validator Validator
    verifier  Verifier

    def data
      @data ||= Array(source).map(&:to_s)
    end
  end
end
