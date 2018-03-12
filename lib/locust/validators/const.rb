class Locust
  module Validators
    #
    # @private
    # The 'const' validator of object schema
    #
    # @see Data Type Format in OpenAPI 2.0 specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#dataTypeFormat
    #
    class Const < Base
      def errors(object, path)
        return [] if self == object
        ["The value #{object} of object #{path} differs from #{self}"]
      end
    end
  end
end
