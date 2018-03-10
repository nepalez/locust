class Locust::Schema
  #
  # @private
  # Container for definition of the 'enum' part of object schema
  #
  # @see Enum in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.2
  #
  class Keywords::Enum < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      super uniq_array(value)
      raise_error(value) unless self == value && any?
    end

    def raise_error(value)
      raise DefinitionError,
            "Invalid value #{value.inspect} for the 'enum' keyword." \
            " The value of this keyword MUST be an array." \
            " This array SHOULD have at least one element." \
            " Elements in the array SHOULD be unique."
    end

    def uniq_array(value)
      value.uniq
    rescue
      raise_error(value)
    end
  end
end
