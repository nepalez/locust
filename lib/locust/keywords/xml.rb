module Locust::Keywords
  #
  # @private
  # Container for definition of the 'xml' part of object schema
  #
  # @see Xml Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#xmlObject
  #
  class Xml < Locust::Schema
    require_relative "xml/validator"

    keyword "xml"

    option :name,      XmlName
    option :namespace, XmlNamespace
    option :prefix,    XmlPrefix
    option :attribute, XmlAttribute
    option :wrapped,   XmlWrapped
  end
end
