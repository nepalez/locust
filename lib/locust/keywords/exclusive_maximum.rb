class Locust
  module Keywords
    #
    # @private
    # @see The 'exclusiveMaximum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
    #
    class ExclusiveMaximum < BaseNumber
      def errors(object, path)
        return [] unless object.is_a? Numeric
        return [] if self > object
        ["The value #{object} of object #{path} is not less than #{self}"]
      end
    end
  end
end
