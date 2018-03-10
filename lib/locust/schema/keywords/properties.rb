class Locust::Schema
  #
  # @private
  # Container for definition of the 'properties' part of object schema
  #
  # @see Properties in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.4
  #
  class Keywords::Properties < SimpleDelegator
    extend Coercion

    private

    def initialize(value = {})
      data = hashify(value).each_with_object({}) do |(key, item), obj|
        obj[key] = Object.call(item)
      end

      super data
    end

    def hashify(value)
      Hash(value).each_with_object({}) { |(key, val), obj| obj[key.to_s] = val }
    rescue
      raise_error(value)
    end

    def raise_error(value)
      raise DefinitionError,
            "Invalid value #{value.inspect} for the 'properties' keyword." \
            " The value of this keyword MUST be an object." \
            " Each value of this object MUST be a valid Object Schema."
    end
  end
end
