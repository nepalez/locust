module Locust::Schemas
  #
  # @private
  # @see The 'properties' keyword in JSON Schemas Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-01#section-6.5.4
  #
  class Properties < Base
    keyword "properties"

    def data
      @data ||= begin
        src = source.is_a?(Hash) ? source : {}
        src.each_with_object({}) do |(k, v), obj|
          obj[k.to_s] = Property.call({ key: k, source: v }, parent)
        end
      end
    end

    def [](key)
      data[key.to_s]
    end
  end
end
