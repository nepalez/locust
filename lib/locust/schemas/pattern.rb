module Locust::Schemas
  #
  # @private
  # @see The 'pattern' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.3.3
  #
  class Pattern < Base
    keyword "pattern"

    def matcher
      @matcher ||= Regexp.new source.to_s
    end
  end
end
