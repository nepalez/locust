class Locust::Schema
  #
  # @private
  # Container for definition of the 'items' part of object schema
  #
  # @see Items in JSON Schema Specification
  #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.4.1
  #
  class Items < SimpleDelegator
    extend Coercion

    private

    def initialize(value)
      value = [value] unless value.is_a? Array
      value = value.map { |item| Object.call(item) }
      super value
    end
  end
end
