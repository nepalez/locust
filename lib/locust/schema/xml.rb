module Locust::Schema
  #
  # @private
  # Container for definition of the 'xml' part of object schema
  #
  # @see XML Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class XML
    extend Dry::Initializer
    extend Coercion

    option :name,      proc(&:to_s),    optional: true
    option :namespace, proc(&:to_s),    optional: true
    option :prefix,    proc(&:to_s),    optional: true
    option :attribute, true.method(:&), default: -> { false }
    option :wrapped,   true.method(:&), default: -> { false }
  end
end
