module Locust::Schema
  #
  # @private
  # @see The 'enum' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.2
  #
  class Enum < Locust::Struct
    keyword "enum"

    def demand
      "The value of this keyword MUST be a non-empty array."
    end

    def validate
      return __schema_error__ unless source.is_a?(Array)
      return __schema_error__ if source.empty?
      source.flat_map.with_index do |item, index|
        parent.verify(item, *full_path, index)
      end
    end

    def verify(data, *path)
      return [] unless source.is_a?(Array)
      source.include?(data) ? [] : __data_error__(path)
    end
  end
end
