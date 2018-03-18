class Locust
  module Keywords
    #
    # @private
    # @see The 'const' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-handrews-json-schema-validation-00#section-6.1.3
    #
    class Const < Base
      def errors(object, path)
        return [] if self == object
        ["The value #{object} of object #{path} differs from #{self}"]
      end
    end
  end
end
