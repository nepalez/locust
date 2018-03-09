class Locust::Schema
  #
  # @private
  # Container for definition of the 'required' part of object schema
  #
  # It describes the array of required parameters of some object
  #
  # @see Required in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.5.3
  #
  class Required < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      value = value.map(&:to_s) rescue nil
      super value&.reject(&:empty?)&.uniq

      return if value&.== self
      raise ArgumentError,
            "Invalid value #{value.inspect} for the 'required' keyword." \
            " The value of this keyword MUST be an array." \
            " Elements of this array, if any, MUST be non-empty strings," \
            " and MUST be unique."
    end
  end
end
