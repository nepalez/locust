module Locust::Keywords
  #
  # @private
  # @see The 'name' keyword in  the 'xml' part of object schema
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#xml-object
  #   https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.0.md#xmlObject
  #
  class XmlName < Locust::Schema
    require_relative "xml_name/validator"

    keyword "name"
  end
end
