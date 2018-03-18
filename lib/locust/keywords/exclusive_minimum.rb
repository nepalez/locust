class Locust
  module Keywords
    #
    # @private
    # @see The 'exclusiveMinimum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
    #
    class ExclusiveMinimum < BaseNumber
      def errors(object, path)
        return [] unless object.is_a? Numeric
        return [] if self < object
        ["The value #{object} of object #{path} is not greater than #{self}"]
      end
    end
  end
end
