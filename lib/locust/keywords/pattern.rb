module Locust::Keywords
  #
  # @private
  # @see The 'pattern' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.3.3
  #
  class Pattern < Locust::Schema
    require_relative "pattern/validator"

    keyword   "pattern"
    validator Validator

    def matcher
      @matcher ||= Regexp.new source.to_s
    end
  end
end
