module Locust::Schema
  #
  # @private
  # @see The 'allOf' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
  #
  class AllOf < Locust::Struct
    keyword "allOf"

    def list
      @list ||= if source.is_a? Array
                  source.map { |item| Object.call(item, parent) }
                else
                  []
                end
    end

    def demand
      "The value of this keyword MUST be an array"
    end

    def validate
      source.is_a?(Array) ? [] : __schema_error__
    end

    def verify(data, *path)
      return [] unless source.is_a?(Array)
      source.map { |item| item.verify(data, *path) }
    end
  end
end
