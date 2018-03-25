module Locust::Schema
  #
  # @private
  # @see The 'pattern' keyword in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.3.3
  #
  class Pattern < Locust::Struct
    keyword "pattern"

    def matcher
      @matcher ||= Regexp.new source.to_s
    end
  end
end
