class Locust
  module Validators
    #
    # @private
    # The 'type' validator of object schema
    #
    # @see Data Type Format in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
    #
    class Type < Base
      def errors(object, path)
        return [] if TYPES[self].find { |type| object.is_a? type }
        ["The value #{object} of object #{path} is not a #{self}"]
      end

      private

      def initialize(value)
        super value.to_s
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
