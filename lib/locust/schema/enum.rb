class Locust::Schema
  #
  # @private
  # Container for definition of the 'enum' part of object schema
  #
  # @see Enum in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.2
  #
  class Enum < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      super uniq_array(value)
      return if self == value && any?
      raise DefinitionError,
            "Invalid value #{value.inspect} for the 'enum' keyword." \
            " The value of this keyword MUST be an array." \
            " This array SHOULD have at least one element." \
            " Elements in the array SHOULD be unique."
    end

    def uniq_array(value)
      value.uniq
    rescue
      []
    end
  end
end
