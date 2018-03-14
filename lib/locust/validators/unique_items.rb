class Locust
  module Validators
    #
    # @private
    # @see The 'minimum' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.1.3
    #
    class UniqueItems < BaseBoolean
      def errors(object, path)
        return [] if self == false
        return [] unless object.is_a? Array
        return [] if object.count == object.uniq.count
        ["The list #{path} contains duplicates"]
      end
    end
  end
end
