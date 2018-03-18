class Locust
  module Keywords
    #
    # @private
    # @see The 'pattern' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.3.3
    #
    class Pattern < Base
      def errors(object, path)
        return [] unless object.is_a? String
        return [] if accept? object
        ["The value #{object} of the object #{path}" \
         " doesn't satisfy the pattern #{self}"]
      end

      def accept?(string)
        !reject?(string)
      end

      def reject?(string)
        !match(string.to_s)
      end

      private

      def initialize(parent, value)
        super parent, Regexp.new(value.to_s)
      rescue
        raise_error(value)
      end

      def raise_error(value)
        raise InvalidSchemaError,
              "Invalid value #{value.inspect} for the 'pattern' keyword." \
              " The value of this keyword MUST be a string." \
              " This string SHOULD be a valid regular expression," \
              " according to the ECMA 262 regular expression dialect."
      end
    end
  end
end
