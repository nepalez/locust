module Locust::Keywords
  #
  # @private
  # @see The 'allOf' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.1
  #
  class AllOf < Locust::Schema
    require_relative "all_of/validator"

    keyword   "allOf"
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
