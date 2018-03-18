class Locust
  module Keywords
    #
    # @private
    # @see The 'multipleOf' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.1
    #
    class MultipleOf < BasePositive
      def errors(object, path)
        return [] unless object.is_a? Numeric
        return [] if (object.rationalize % rationalize).zero?
        ["The value #{object} of object #{path} is not a multiple of #{self}"]
      end
    end
  end
end
