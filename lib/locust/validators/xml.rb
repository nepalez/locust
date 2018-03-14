class Locust
  module Validators
    #
    # @private
    # Container for definition of the 'xml' part of object schema
    #
    # @see XML Object in OpenAPI Specification
    #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
    #
    class XML < Schema
      option :name,      proc(&:to_s)
      option :namespace, proc(&:to_s)
      option :prefix,    proc(&:to_s)
      option :attribute, true.method(:&), default: -> { false }
      option :wrapped,   true.method(:&), default: -> { false }
    end
  end
end
