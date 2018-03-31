module Locust::Keywords
  #
  # @private
  # @see The 'attribute' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#xmlObject
  #
  class XmlAttribute < Locust::Schema
    require_relative "xml_attribute/validator"

    keyword "attribute"
  end
end
