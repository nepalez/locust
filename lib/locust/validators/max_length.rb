class Locust
  module Validators
    #
    # @private
    # @see The 'maxLength' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.1
    #
    class MaxLength < BasePositive
      def errors(object, path)
        return [] unless object.respond_to? :length
        return [] if object.length <= self
        ["The length of value '#{object}' of object #{path} exceeds #{to_i}"]
      end
    end
  end
end
