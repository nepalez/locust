class Locust
  module Validators
    #
    # @private
    # @see The 'minLength' keyword in JSON Schema Specification
    #   https://tools.ietf.org/html/draft-fge-json-schema-validation-00#section-6.3.2
    #
    class MinLength < BasePositive
      def errors(object, path)
        return [] unless object.respond_to? :length
        return [] if object.length >= self
        ["The length of value '#{object}' of object #{path}" \
         " is less than #{self}"]
      end
    end
  end
end
