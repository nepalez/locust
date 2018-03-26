module Locust::Schema
  #
  # @private
  # @see The 'allOf' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
  #
  class AllOf < Locust::Struct
    keyword "allOf"

    def data
      @data ||= begin
        src = Array === source ? source : []
        src.map { |item| Object.call(item, parent) }
      end
    end

    def [](index)
      data[index]
    end
  end
end
