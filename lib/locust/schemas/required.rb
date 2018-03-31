module Locust::Schemas
  #
  # @private
  # @see The 'required' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.3
  #
  class Required < Base
    keyword "required"

    def data
      @data ||= Array(source).map(&:to_s)
    end
  end
end
