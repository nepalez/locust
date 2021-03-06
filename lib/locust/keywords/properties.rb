module Locust::Keywords
  #
  # @private
  # @see The 'properties' keyword in JSON Keywords Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.4
  #
  class Properties < Locust::Schema
    require_relative "properties/validator"
    require_relative "properties/verifier"

    keyword   "properties"
    validator Validator
    verifier  Verifier

    def schemas
      @schemas ||= begin
        src = source.is_a?(Hash) ? source : {}
        src.each_with_object({}) do |(k, v), obj|
          obj[k.to_s] = Property.call({ key: k, source: v }, parent)
        end
      end
    end

    def [](key)
      schemas[key.to_s]
    end
  end
end
