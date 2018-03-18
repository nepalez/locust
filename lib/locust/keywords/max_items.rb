class Locust
  module Keywords
    #
    # @private
    # @see The 'maxItems' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.2
    #
    class MaxItems < BasePositive
      def errors(object, path)
        return [] unless object.is_a? Array
        return [] if object.count <= self
        ["The number of items in #{path} exceeds #{to_i}"]
      end
    end
  end
end
