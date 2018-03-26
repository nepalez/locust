module Locust::Schema
  #
  # @private
  # @see The 'required' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.3
  #
  class Required < Locust::Struct
    keyword "required"

    def data
      @data ||= Array(source).map(&:to_s)
    end
  end
end
