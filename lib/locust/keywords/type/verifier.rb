class Locust::Keywords::Type
  #
  # Checks the type keyword definition
  #
  class Verifier < Locust::Verifier
    validate :type_is_valid

    private

    def type_is_valid
      return if object.nil? && nullable?
      TYPES[schema.source].each { |type| return if object.is_a?(type) }
      errors << message
    end

    def nullable?
      schema.parent.nullable.source
    end

    TYPES = {
      "null"    => [NilClass],
      "boolean" => [FalseClass, TrueClass],
      "integer" => [Integer],
      "number"  => [Numeric],
      "string"  => [String],
      "object"  => [Hash],
      "array"   => [Array],
      "file"    => [File, Tempfile, StringIO],
    }
  end
end
