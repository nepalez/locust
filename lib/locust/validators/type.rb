class Locust
  module Validators
    #
    # @private
    # @see The 'type' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.1
    #
    class Type < BaseString
      def errors(object, path)
        return [] if TYPES[self].find { |type| object.is_a? type }
        ["The value #{object} of object #{path} is not a #{self}"]
      end

      private

      def initialize(parent, value)
        super
        raise_error(value) unless TYPES.keys.include? self
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'type' keyword." \
              " The value of this keyword MUST be one of the strings:" \
              " '#{TYPES.keys.join("', '")}'."
      end

      TYPES = {
        "null"    => [NilClass],
        "boolean" => [TrueClass, FalseClass],
        "integer" => [Integer],
        "number"  => [Numeric],
        "string"  => [String, Symbol],
        "array"   => [Array],
        "object"  => [Hash],
        "file"    => [File, Tempfile, IO, StringIO],
      }.freeze
    end
  end
end
