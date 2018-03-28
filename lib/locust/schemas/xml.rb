module Locust::Schemas
  #
  # @private
  # Container for definition of the 'xml' part of object schema
  #
  # @see Xml Object in OpenAPI Specification
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #
  class Xml < Base
    keyword "xml"

    option :name,      XmlName
    option :namespace, XmlNamespace
    option :prefix,    XmlPrefix
    option :attribute, XmlAttribute
    option :wrapped,   XmlWrapped
  end
end
