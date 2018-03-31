module Locust::Schemas
  #
  # @private
  # @see The 'anyOf' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.7.2
  #
  class AnyOf < Base
    keyword "anyOf"

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
