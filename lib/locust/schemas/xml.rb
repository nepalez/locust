module Locust::Schemas
  #
  # @private
  # Container for definition of the 'xml' part of object schema
  #
  # @see XML Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class XML < Base
    require_relative "xml/attribute"
    require_relative "xml/name"
    require_relative "xml/namespace"
    require_relative "xml/prefix"
    require_relative "xml/wrapped"

    keyword "xml"
    option  :name,      Name
    option  :namespace, Namespace
    option  :prefix,    Prefix
    option  :attribute, Attribute
    option  :wrapped,   Wrapped
  end
end
