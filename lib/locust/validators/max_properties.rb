class Locust
  module Validators
    #
    # @private
    # @see The 'maxProperties' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-5.4.1
    #
    class MaxProperties < BasePositive
      def errors(object, path)
        return [] unless object.is_a? Hash
        return [] if object.count <= self
        ["The number of properties of object #{path} exceeds #{to_i}"]
      end
    end
  end
end
