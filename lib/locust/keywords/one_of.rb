module Locust::Keywords
  #
  # @private
  # @see The 'oneOf' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.3
  #
  class OneOf < Locust::Schema
    require_relative "one_of/validator"
    require_relative "one_of/verifier"

    keyword   "oneOf"
    validator Validator
    verifier  Verifier

    def data
      @data ||= begin
        src = source.is_a?(Array) ? source : []
        src.map { |item| Object.call(item, parent) }
      end
    end

    def [](index)
      data[index]
    end
  end
end
