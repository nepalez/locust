module Locust::Keywords
  #
  # @private
  # @see The 'not' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.4
  #
  class Not < Locust::Schema
    require_relative "not/validator"

    keyword   "not"
    validator Validator

    def schema
      @schema ||= Object.call(source, self)
    end
  end
end
