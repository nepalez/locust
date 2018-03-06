module Locust::Schema
  #
  # @private
  # Container for definition of the 'enum' part of object schema
  #
  # @see OpenAPI 2.0 specification for formats
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#data-types
  #
  class Enum < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      super uniq_array(value)
      return if self == value && any?
      raise ArgumentError,
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
