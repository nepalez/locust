class Locust
  module Keywords
    #
    # @private
    # @see The 'minItems' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.3.3
    #
    class MinItems < BasePositive
      def errors(object, path)
        return [] unless object.is_a? Array
        return [] if object.count >= self
        ["The number of items in #{path} is less than #{to_i}"]
      end
    end
  end
end
