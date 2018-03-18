class Locust
  module Keywords
    #
    # @private
    # @see The 'maximum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.2
    #
    class Maximum < BaseNumber
      def errors(object, path)
        return [] unless object.is_a? Numeric
        return [] if self >= object
        ["The value #{object} of object #{path} is greater than #{self}"]
      end
    end
  end
end
