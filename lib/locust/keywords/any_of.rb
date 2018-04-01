module Locust::Keywords
  #
  # @private
  # @see The 'anyOf' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.2
  #
  class AnyOf < Locust::Schema
    require_relative "any_of/validator"

    keyword   "anyOf"
    validator Validator

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
