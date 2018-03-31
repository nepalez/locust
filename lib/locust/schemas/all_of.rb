module Locust::Schemas
  #
  # @private
  # @see The 'allOf' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.1
  #
  class AllOf < Base
    keyword "allOf"

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
