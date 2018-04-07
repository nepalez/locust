class Locust::Keywords::Type
  #
  # Checks the type keyword definition
  #
  class Verifier < Locust::Verifier
    validate :object_has_a_proper_type

    private

    def object_has_a_proper_type
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
